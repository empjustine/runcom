-- ~/.xmonad/xmonad.hs
-- ===================

import XMonad
import qualified XMonad.StackSet
import qualified XMonad.ManageHook


-- Modern Window Managers compatibility
import qualified XMonad.Hooks.EwmhDesktops
import qualified XMonad.Hooks.ManageDocks
import qualified XMonad.Hooks.UrgencyHook


import qualified XMonad.Layout.HintedTile


-- Allows fixed column layouts
import qualified XMonad.Layout.FixedColumn
-- Allows renaming of workspaces
import qualified XMonad.Layout.Renamed
-- Smart borders
import qualified XMonad.Layout.NoBorders


-- Easy keybindings
import qualified XMonad.Util.EZConfig


import qualified Solarized

import qualified Hooks

main = xmonad
     $ XMonad.Hooks.EwmhDesktops.ewmh
     $ XMonad.Hooks.UrgencyHook.withUrgencyHook
         XMonad.Hooks.UrgencyHook.NoUrgencyHook
     $ defaultConfig
       { modMask  = myModMask
       , terminal = myTerminal

       , layoutHook      = XMonad.Hooks.ManageDocks.avoidStruts
                         $ XMonad.Layout.NoBorders.smartBorders myLayoutHook
       , handleEventHook = XMonad.Hooks.EwmhDesktops.fullscreenEventHook
     XMonad.ManageHook.<+> XMonad.Hooks.ManageDocks.docksEventHook
       , logHook         = Hooks.logHook
       , manageHook      = XMonad.Hooks.ManageDocks.manageDocks
     XMonad.ManageHook.<+> myManageHook

       , workspaces      = myWorkspaceNames

       , normalBorderColor  = Solarized.base01
       , focusedBorderColor = Solarized.red

       , borderWidth        = myBorderWidth
       } `XMonad.Util.EZConfig.additionalKeys`
       myKeyBindings
  where
    myTerminal    :: String
    myTerminal     = "/usr/bin/uxterm"

    myBorderWidth :: Dimension
    myBorderWidth  = 1

    -- super key
    myModMask :: KeyMask
    myModMask  = mod4Mask

    myWorkspaceNames    :: [String]
    myWorkspaceNames     = (map show [1..9])
                        ++ ["0",  "-",      "="]

    myWorkspaceKeyCodes :: [KeySym]
    myWorkspaceKeyCodes  = [xK_1..xK_9]
                        ++ [xK_0, xK_minus, xK_equal]

    myWorkspaceKeyBindings :: [((KeyMask, KeySym), X ())]
    myWorkspaceKeyBindings  =
      [((m .|. myModMask, k), windows $ f i)
        | (i, k) <- zip myWorkspaceNames myWorkspaceKeyCodes
        , (f, m) <- [ (XMonad.StackSet.greedyView, 0)
                    , (XMonad.StackSet.shift, shiftMask)
                    ]
      ]

    myKeyBindings :: [((KeyMask, KeySym), X ())]
    myKeyBindings  =
      [ ((myModMask, xK_b), sendMessage XMonad.Hooks.ManageDocks.ToggleStruts)
      ]
      ++
      myWorkspaceKeyBindings

    myManageHook = composeAll
   -- , isFullscreen --> doFullFloat
   -- , isDialog     --> doCenterFloat
      [ appName =? "push_setup"           --> doFloat -- git-gui push modal dialogs
      , appName =? "__console____o2____d" --> doFloat
      , appName =? "__console____o1____d" --> doFloat
      , appName =? "Download"             --> doFloat -- firefox

      , manageHook defaultConfig
      ]

    hintedTile  = XMonad.Layout.HintedTile.HintedTile
                    nmaster deltaRatio goldenRatio
                    XMonad.Layout.HintedTile.TopLeft
    named str   = XMonad.Layout.Renamed.renamed
                    [ XMonad.Layout.Renamed.Replace str ]

    tall        = named "TALL" $ hintedTile XMonad.Layout.HintedTile.Tall
    mirror      = named "WIDE" $ hintedTile XMonad.Layout.HintedTile.Wide

    full        = named "FULL" $ Full
    code        = named "CODE" $ XMonad.Layout.FixedColumn.FixedColumn nmaster 20 80 10

    nmaster     = 1
    deltaRatio  = (5/100)
    magniRatio  = 1.4
    goldenRatio = (2/(1+(toRational(sqrt(5)::Double))))

    myLayoutHook = (code ||| mirror ||| tall ||| full)
