--
-- Copyright (c) 2013 Bonelli Nicola <bonelli@antifork.org>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
--

module CGrep.Strategy.Simple (cgrepSimple) where

import qualified Data.ByteString.Char8 as C

import CGrep.Function
import CGrep.StringLike
import CGrep.Common
import CGrep.Output

import Options 
import Debug

cgrepSimple :: CgrepFunction
cgrepSimple opt ps f = do

    putStrLevel1 (debug opt) $ "strategy  : running simple parser on " ++ f ++ "..."
    
    source <- if f == "" then slGetContents (ignore_case opt)  
                         else slReadFile (ignore_case opt) f
    
    let multi_source = spanMultiLine (multiline opt) source
    
    let content = (zip [1..] . C.lines) multi_source 

    let matches = concatMap (basicGrep opt ps) content

    putStrLevel2 (debug opt) $ "matches: " ++ show matches
    putStrLevel3 (debug opt) $ "---\n" ++ C.unpack source ++ "\n---"

    return $ mkOutput f source matches 
