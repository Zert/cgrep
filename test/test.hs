--
-- Lorem ipsum dolor sit. Amet perferendis metus feugiat. Suspendisse massa egestas quam.
-- Morbi vivamus dolor nisl mauris ultricies molestie lacus. Proin ad nullam id integer.
--

{-
      Eget orci rutrum vel. Elit nullam amet integer. Fusce tellus ut massa. Maecenas risus dictum risus.
      Augue aliquam molestie id. Commodo ultricies pede massa fusce ullamcorper dapibus dui.
      Maecenas elementum duis porttitor facilisis lectus eleifend nec. Arcu et pellentesque
      tellus non tristique suscipit nec. Tempor iaculis orci nec enim ac.
 -}

{-# LANGUAGE QuasiQuotes #-}

import Data.String.Here

main = do
       putStrLn "Sed etiam a suspendisse. \"Aliquam nulla erat risus.\""
       putStrLn [here| Sed etiam a suspendisse. "Aliquam nulla erat risus." |]
