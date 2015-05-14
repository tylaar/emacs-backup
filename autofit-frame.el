<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: autofit-frame.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=autofit-frame.el" /><link type="text/css" rel="stylesheet" href="/css/emacs.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: autofit-frame.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=autofit-frame.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for autofit-frame.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=autofit-frame.el" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22autofit-frame.el%22">autofit-frame.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs-en/download/autofit-frame.el">Download</a></p><pre class="code"><span class="linecomment">;;; autofit-frame.el --- Automatically resize one-window frames to fit</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: autofit-frame.el</span>
<span class="linecomment">;; Description: Automatically resize one-window frames to fit.</span>
<span class="linecomment">;; Author: Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 2000-2013, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Created: Thu Dec  7 10:06:18 2000</span>
<span class="linecomment">;; Version: 21.0</span>
<span class="linecomment">;; Last-Updated: Fri Dec 28 09:24:24 2012 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 691</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/autofit-frame.el</span>
<span class="linecomment">;; Doc URL: http://www.emacswiki.org/emacs/Shrink-Wrapping_Frames</span>
<span class="linecomment">;; Keywords: internal, extensions, convenience, local</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   `fit-frame', `misc-fns', `strings', `thingatpt', `thingatpt+'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Automatically resize one-window frames to fit.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Functions are provided here to automatically resize each frame to</span>
<span class="linecomment">;;  fit its selected window, when there is no other window in the</span>
<span class="linecomment">;;  frame.  Some standard Emacs primitive functions are redefined to</span>
<span class="linecomment">;;  do this: `display-buffer' (prior to Emacs 23 only),</span>
<span class="linecomment">;;  `switch-to-buffer', and `pop-to-buffer' (prior to Emacs 23 only).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Prior to Emacs 23, automatic frame resizing is also provided here</span>
<span class="linecomment">;;  implicitly for functions `switch-to-buffer-other-window' and</span>
<span class="linecomment">;;  `switch-to-buffer-other-frame', since they ultimately use</span>
<span class="linecomment">;;  `display-buffer', and so the version of it defined here.  (Command</span>
<span class="linecomment">;;  `switch-to-buffer' does not use `display-buffer' - it is redefined</span>
<span class="linecomment">;;  separately here, for all Emacs versions.)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Put the following in your Emacs initialization file (`~/.emacs'),</span>
<span class="linecomment">;;  in order to provide for automatic frame resizing:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (require 'autofit-frame)</span>
<span class="linecomment">;;    (add-hook 'after-make-frame-functions 'fit-frame)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The second line here causes newly created frames to be fitted to</span>
<span class="linecomment">;;  their buffer (window).  Even if you load `auto-fit-frames.el', you</span>
<span class="linecomment">;;  will still need to do this, because `display-buffer' and so on are</span>
<span class="linecomment">;;  not called when a new frame is created.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  To automatically fit frames that show a temporary buffer in their</span>
<span class="linecomment">;;  sole window, add this to your initialization file also:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    (add-hook 'temp-buffer-show-hook</span>
<span class="linecomment">;;              'fit-frame-if-one-window 'append)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  User option (variable) `autofit-frames-flag' turns on and off the</span>
<span class="linecomment">;;  automatic resizing defined here.  Setting it to nil turns it off:</span>
<span class="linecomment">;;  (setq autofit-frames-flag nil).  You can also bind it to nil to</span>
<span class="linecomment">;;  temporarily inhibit frame resizing in Lisp code:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;         (let ((autofit-frames-flag nil))...)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  New user option (variable) defined here: `autofit-frames-flag'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  New function defined here (useful as a `temp-buffer-show-hook'):</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `fit-frame-if-one-window'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following function defined in `window.el' has been</span>
<span class="linecomment">;;              REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `window--display-buffer-1' (Emacs 23+) -</span>
<span class="linecomment">;;     Resize frame to fit sole window if `autofit-frames-flag'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  ***** NOTE: The following EMACS PRIMITIVES are REDEFINED HERE:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `display-buffer' (prior to Emacs 23 only) -</span>
<span class="linecomment">;;     1) Use `read-buffer' in interactive spec.</span>
<span class="linecomment">;;     2) Resize frame to fit sole window if `autofit-frames-flag'</span>
<span class="linecomment">;;        (and provided buffer was not yet displayed).</span>
<span class="linecomment">;;     3) Raise the frame.</span>
<span class="linecomment">;;     4) Restore point in buffer - fixes unknown Emacs 22 bug.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `pop-to-buffer' (prior to Emacs 23 only) -</span>
<span class="linecomment">;;     Use the `display-buffer' defined here.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  `switch-to-buffer' (all Emacs versions) -</span>
<span class="linecomment">;;     1) Use `read-buffer' in interactive spec.</span>
<span class="linecomment">;;     2) If current window is dedicated, then use another window.</span>
<span class="linecomment">;;     3) Resize frame to fit sole window if `autofit-frames-flag'</span>
<span class="linecomment">;;        (unless BUFFER is already the `current-buffer').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This file loads file `fit-frame.el', which provides the main</span>
<span class="linecomment">;;  functionality behind the automatic frame resizing.  See it for</span>
<span class="linecomment">;;  user options to do such things as customize default frame sizes.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  The reason for separating the code here from that in</span>
<span class="linecomment">;;  `fit-frame.el' is to let you load that code but not load the code</span>
<span class="linecomment">;;  here, if you do not want to redefine Emacs primitives.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  This file was formerly called `shrink-fit-all.el', then</span>
<span class="linecomment">;;  `auto-resize-frames.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  See also these files for other frame commands:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `doremi-frm.el'    - Incrementally adjust frame properties</span>
<span class="linecomment">;;                          using arrow keys and/or mouse wheel.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `frame-cmds.el'    - Miscellaneous frame and window commands.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `thumb-frm.el'     - Shrink frames to a thumbnail size and</span>
<span class="linecomment">;;                          restore them again.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     `zoom-frm.el'      - Zoom a frame, so that its font becomes</span>
<span class="linecomment">;;                          larger or smaller.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change Log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2011/11/30 dadams</span>
<span class="linecomment">;;     switch-to-buffer:</span>
<span class="linecomment">;;       Pass NORECORD arg to switch-to-buffer-other-window.</span>
<span class="linecomment">;;       Emacs 24+: Same as other versions: use other window if dedicated window.</span>
<span class="linecomment">;; 2011/11/08 dadams</span>
<span class="linecomment">;;     switch-to-buffer: Added Emacs 24+ version (they changed Emacs 24 again).</span>
<span class="linecomment">;; 2011/10-19 dadams</span>
<span class="linecomment">;;     Removed redefinition of pop-to-buffer-same-window (Emacs 24 pretest).</span>
<span class="linecomment">;; 2011/08/14 dadams</span>
<span class="linecomment">;;     Added redefinition of pop-to-buffer-same-window, for Emacs 24.</span>
<span class="linecomment">;; 2011/02/25 dadams</span>
<span class="linecomment">;;     switch-to-buffer:</span>
<span class="linecomment">;;       If BUFFER is nil, use other-buffer.  Thx to Martial Boniou.</span>
<span class="linecomment">;; 2011/01/03 dadams</span>
<span class="linecomment">;;     Removed autoload cookies: non def* sexps, non-interactive functions.</span>
<span class="linecomment">;; 2009/05/03 dadams</span>
<span class="linecomment">;;     Use (fboundp 'window--display-buffer-1), not Emacs version test.</span>
<span class="linecomment">;; 2009/03/08 dadams</span>
<span class="linecomment">;;     Do not redefine for Emacs 23+: pop-to-buffer, display-buffer.</span>
<span class="linecomment">;;     Added (Emacs 23+): window--display-buffer-1.</span>
<span class="linecomment">;;     display-buffer: Added save-excursion around save-selected-window.</span>
<span class="linecomment">;; 2007/09/03 dadams</span>
<span class="linecomment">;;     Added: redefinition of pop-to-buffer.</span>
<span class="linecomment">;;     display-buffer: Raise frame.  Needed for buffer in thumbnail frame.</span>
<span class="linecomment">;;                     Don't fit frame if buffer was already displayed.</span>
<span class="linecomment">;; 2007/02/14 dadams</span>
<span class="linecomment">;;     display-buffer: Hack: restore point, to work around some Emacs 22 bug.</span>
<span class="linecomment">;; 2006/03/07 dadams</span>
<span class="linecomment">;;     switch-to-buffer: Bug fix: return destination buffer.  Thx to AndreyZ.</span>
<span class="linecomment">;; 2006/01/07 dadams</span>
<span class="linecomment">;;     Added :link for sending bug report.</span>
<span class="linecomment">;; 2006/01/06 dadams</span>
<span class="linecomment">;;     Removed defgroup - we require fit-frame.el, which does it.</span>
<span class="linecomment">;; 2005/09/02 dadams</span>
<span class="linecomment">;;     switch-to-buffer: Don't require existing buffer.</span>
<span class="linecomment">;; 2005/05/28 dadams</span>
<span class="linecomment">;;     autofit-frames-flag: defvar -&gt; defcustom.  Added defgroup fit-frame.</span>
<span class="linecomment">;;     switch-to-buffer: Use explicit default in read-buffer.</span>
<span class="linecomment">;;       Require misc-fns.el.</span>
<span class="linecomment">;; 2004/10/07 dadams</span>
<span class="linecomment">;;     Renamed resize-* to fit-*, per RMS.</span>
<span class="linecomment">;;     Renamed automatically-resize-frames-p to autofit-frames-flag.</span>
<span class="linecomment">;; 2004/09/21 dadams</span>
<span class="linecomment">;;     Commented-out redefinition of pop-to-buffer.  Removed it from intro.</span>
<span class="linecomment">;; 2004/06/01 dadams</span>
<span class="linecomment">;;     1. Replaced fit-frame-when-display-p, fit-frame-when-pop-to-p,</span>
<span class="linecomment">;;        and fit-frame-when-switch-to-p by</span>
<span class="linecomment">;;        automatically-resize-frames-p.</span>
<span class="linecomment">;;     2. Removed pop-to-buffer and</span>
<span class="linecomment">;;        resize-frame-if-one-window-and-cond.</span>
<span class="linecomment">;;     3. Renamed fit-frame-* to resize-frame-*.  Renamed file.</span>
<span class="linecomment">;;     4. switch-to-buffer: Don't resize if buffer is already current.</span>
<span class="linecomment">;; 2004/05/07 dadams</span>
<span class="linecomment">;;     Updated to work with Emacs 21:</span>
<span class="linecomment">;;       pop-to-buffer has additional arg and doc-string changes</span>
<span class="linecomment">;;       display-buffer has doc-string changes</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

(require 'fit-frame) <span class="linecomment">;; fit-frame</span>
(require 'strings nil t) <span class="linecomment">;; (no error if not found) read-buffer</span>
(require 'misc-fns nil t) <span class="linecomment">;; (no error if not found) another-buffer</span>

(unless (&gt; emacs-major-version 22)      <span class="linecomment">; Quiet the byte-compiler.</span>
  (defvar display-buffer-reuse-frames))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>
 
<span class="linecomment">;;; User options ---------------------------------------------------</span>

<span class="linecomment">;;;###autoload</span>
(defcustom autofit-frames-flag t
  "<span class="quote">*Non-nil means automatically resize one-window frames to fit buffer.</span>"
  :type 'boolean :group 'Fit-Frame      <span class="linecomment">; Group is defined in `fit-frame.el'.</span>
  :link `(url-link :tag "<span class="quote">Send Bug Report</span>"
          ,(concat "<span class="quote">mailto:</span>" "<span class="quote">drew.adams</span>" "<span class="quote">@</span>" "<span class="quote">oracle</span>" "<span class="quote">.com?subject=\
autofit-frame.el bug: \
&body=Describe bug here, starting with `emacs -q'.  \
Don't forget to mention your Emacs and library versions.</span>")))




<span class="linecomment">;;; Non-interactive functions ---------------------------------</span>

<span class="linecomment">;; This is not used here.  It is useful as a `temp-buffer-show-hook':</span>
<span class="linecomment">;;   (add-hook 'temp-buffer-show-hook 'fit-frame-if-one-window 'append)</span>
<span class="linecomment">;;</span>
(defun fit-frame-if-one-window ()
  "<span class="quote">Resize frame to fit selected window if it is alone in the frame.
Usable in `temp-buffer-show-hook'.
This does nothing if `autofit-frames-flag' is nil.</span>"
  (and (one-window-p t) autofit-frames-flag (fit-frame)))


(when (&lt; emacs-major-version 23)

  (or (fboundp 'old-pop-to-buffer)
      (fset 'old-pop-to-buffer (symbol-function 'pop-to-buffer)))

  <span class="linecomment">;; REPLACES ORIGINAL (built-in):</span>
  <span class="linecomment">;; Call my version of `display-buffer'.  Needed because built-in</span>
  <span class="linecomment">;; `pop-to-buffer' calls C version, Fdisplay_buffer, not `display-buffer'.</span>
  <span class="linecomment">;;</span>
  (defun pop-to-buffer (buffer &optional other-window norecord)
    "<span class="quote">Select buffer BUFFER in some window, preferably a different one.
BUFFER may be a buffer, a string (a buffer name), or nil.
 If BUFFER is a string which is not the name of an existing buffer,
    then create a buffer with that name.
 If BUFFER is nil, then choose some other buffer.
 If `pop-up-windows' is non-nil, windows can be split.

If optional second arg OTHER-WINDOW is non-nil, then insist on finding
another window, even if BUFFER is already visible in the selected
window, and ignore `same-window-regexps' and
`same-window-buffer-names'.

Optional third arg NORECORD non-nil means do not put this buffer at
the front of the list of recently selected ones.

Return the buffer switched to.
This uses function `display-buffer' as a subroutine; see the documentation
of `display-buffer' for additional customization information.</span>"
    (display-buffer (get-buffer-create buffer))
    (old-pop-to-buffer buffer other-window norecord)))
 
<span class="linecomment">;;; Commands ---------------------------------------------------</span>

(when (&lt; emacs-major-version 23)

  (or (fboundp 'old-display-buffer)
      (fset 'old-display-buffer (symbol-function 'display-buffer)))

  <span class="linecomment">;; REPLACES ORIGINAL (built-in):</span>
  <span class="linecomment">;; 1) Use `read-buffer' in interactive spec.</span>
  <span class="linecomment">;; 2) Resize frame to fit sole window if `autofit-frames-flag'.</span>
  <span class="linecomment">;; 3) Raise the frame.  In particular, this ensures that a thumbified frame</span>
  <span class="linecomment">;;    is raised (see `thumb-frm.el').</span>
  <span class="linecomment">;; 4) Hack to restore point in buffer - fixes unknown Emacs 22 bug.</span>
  <span class="linecomment">;;</span>
  <span class="linecomment">;; NOTE: It would be better to rewrite the C code, so that the frame</span>
  <span class="linecomment">;;       is not resized if the frame is simply _raised_.</span>
  (defun display-buffer (buffer &optional not-this-window frame)
    "<span class="quote">Make BUFFER appear in some window but don't select it.
BUFFER can be a buffer or the name of an existing buffer.
If BUFFER is shown already in some window, just use that one,
unless the window is the selected window and the optional second
argument NOT-THIS-WINDOW is non-nil (interactively, with prefix arg).
If `pop-up-frames' is non-nil, make a new frame if no window shows BUFFER.
Return the window displaying BUFFER.

Emacs 21 or later only:
  If `display-buffer-reuse-frames' is non-nil, and another frame is
  currently displaying BUFFER, then simply raise that frame.

The variables `special-display-buffer-names', `special-display-regexps',
`same-window-buffer-names', and `same-window-regexps' customize how certain
buffer names are handled.

If optional argument FRAME is `visible', search all visible frames.
If FRAME is 0, search all visible and iconified frames.
If FRAME is t, search all frames.
If FRAME is a frame, search only that frame.
If FRAME is nil, search only the selected frame
 (actually the last nonminibuffer frame),
 unless `pop-up-frames' or `display-buffer-reuse-frames' is non-nil,
 which means search visible and iconified frames.

Emacs 21 or later only:
  If `even-window-heights' is non-nil, window heights will be evened
  out if displaying the buffer causes two vertically adjacent windows
  to be displayed.

Resizes frame to fit sole window if `autofit-frames-flag', but only if
BUFFER was not yet displayed.  If BUFFER was already displayed, its
frame is assumed to already be the size you want (perhaps you resized
it manually).</span>"
    (interactive
     (list (read-buffer "<span class="quote">Display buffer: </span>" (current-buffer) 'existing)
           current-prefix-arg))
    (let* ((wins      ())
           (old-wins  (progn (walk-windows (lambda (w) (push w wins)) t 0) wins))
           (win       (old-display-buffer buffer not-this-window frame))
           (pt        (save-excursion (set-buffer buffer) (point))))
      (when (window-live-p win)
        (save-excursion
          (save-selected-window
            (select-window win)
            (raise-frame)
            (goto-char pt)              <span class="linecomment">; Hack to fix unknown Emacs 22 bug.</span>
            (and (one-window-p t)
                 autofit-frames-flag
                 (not (member win old-wins)) <span class="linecomment">; Don't fit if already displayed.</span>
                 (fit-frame)))))
      win)))                            <span class="linecomment">; Return the window</span>



<span class="linecomment">;; REPLACES ORIGINAL defined in `window.el' (Emacs 23+):</span>
<span class="linecomment">;; Resize frame to fit sole window if `autofit-frames-flag'.</span>
<span class="linecomment">;;</span>
(when (fboundp 'window--display-buffer-1) <span class="linecomment">; Emacs 23+</span>

  <span class="linecomment">;; We save the original anyway, but we don't use it.</span>
  (or (fboundp 'old-window--display-buffer-1)
      (fset 'old-window--display-buffer-1
            (symbol-function 'window--display-buffer-1)))

  (defun window--display-buffer-1 (window)
    "<span class="quote">Raise the frame containing WINDOW.
Do not raise the selected frame.
Resize frame to fit sole window if `autofit-frames-flag'.
Return WINDOW.</span>"
    (let* ((frame    (window-frame window))
           (visible  (frame-visible-p frame)))
      (unless (or (not visible)
                  <span class="linecomment">;; Assume the selected frame is already visible enough.</span>
                  (eq frame (selected-frame))
                  <span class="linecomment">;; Assume frame from which we invoked minibuffer is visible.</span>
                  (and (minibuffer-window-active-p (selected-window))
                       (eq frame (window-frame (minibuffer-selected-window)))))
        (raise-frame frame)
        (save-excursion
          (save-selected-window
            (select-window window)
            (and (one-window-p t) autofit-frames-flag (fit-frame)))))
      window)))



(or (fboundp 'old-switch-to-buffer)
    (fset 'old-switch-to-buffer (symbol-function 'switch-to-buffer)))

(if (&lt; emacs-major-version 24)

    <span class="linecomment">;; REPLACES ORIGINAL (built-in):</span>
    <span class="linecomment">;; 1) Use `read-buffer' interactively.  If null BUFFER, use `other-buffer'.</span>
    <span class="linecomment">;; 2) If current window is dedicated, then use another window, instead of</span>
    <span class="linecomment">;;    raising an error.</span>
    <span class="linecomment">;; 3) Resize frame to fit sole window if `autofit-frames-flag'</span>
    <span class="linecomment">;;    (unless BUFFER is already the `current-buffer').</span>
    (defun switch-to-buffer (buffer &optional norecord)
      "<span class="quote">Select buffer BUFFER in current window, unless the window is dedicated.
If the selected window is dedicated (`window-dedicated-p'), then use
another window.

BUFFER may be a buffer, a string (a buffer name), or nil.  If BUFFER
is a string that does not identify an existing buffer, then a new
buffer with that name is created.  If BUFFER is nil, then function
`other-buffer' is used to choose a buffer.

Optional second arg NORECORD non-nil means do not put BUFFER at the
front of the list of recently selected buffers.

The buffer switched to is returned.

*WARNING*: This is NOT the way to work on another buffer temporarily
within a Lisp program!  Use `set-buffer' instead, to avoid messing
with correspondences between windows and buffers.

Resize frame to fit sole window if `autofit-frames-flag'
\(unless BUFFER is already the `current-buffer').</span>"
      (interactive
       (list (read-buffer "<span class="quote">Switch to buffer: </span>"
                          (if (fboundp 'another-buffer) <span class="linecomment">; In `misc-fns.el'.</span>
                              (another-buffer nil t)
                            (other-buffer (current-buffer))))))
      <span class="linecomment">;; If string arg, convert to a buffer.  If nil, use `other-buffer'.</span>
      (setq buffer  (if buffer (get-buffer-create buffer) (other-buffer)))
      (let ((orig-buf  (current-buffer)))
        (prog1 (if (window-dedicated-p (selected-window))
                   (switch-to-buffer-other-window buffer norecord)
                 (old-switch-to-buffer buffer norecord))
          (and (one-window-p t)
               (not (eq buffer orig-buf)) <span class="linecomment">; Don't resize if same buffer.</span>
               autofit-frames-flag
               (fit-frame)))))

  <span class="linecomment">;; REPLACES ORIGINAL (built-in):</span>
  <span class="linecomment">;;</span>
  <span class="linecomment">;; 1) If current window is dedicated, then use another window,</span>
  <span class="linecomment">;;    instead of raising an error.  In this case, FORCE-SAME-WINDOW is ignored.</span>
  <span class="linecomment">;; 2) Resize frame to fit sole window if `autofit-frames-flag'</span>
  <span class="linecomment">;;    (unless BUFFER is already the `current-buffer').</span>
  <span class="linecomment">;;</span>
  (defun switch-to-buffer (buffer-or-name &optional norecord force-same-window)
    "<span class="quote">Switch to buffer BUFFER-OR-NAME in the selected window.
Return the buffer switched to.

If the selected window is dedicated (`window-dedicated-p'), then use
another window, regardless of argument FORCE-SAME-WINDOW.

If called interactively, prompt for the buffer name with completion.
Variable `confirm-nonexistent-file-or-buffer' determines whether to
require confirmation before creating a new buffer.

BUFFER-OR-NAME may be a buffer, a buffer name (a string), or nil.  If
it is a string that does not identify an existing buffer, create a
buffer with that name.  If nil, switch to `other-buffer'.

Optional argument NORECORD non-nil means do not put the buffer
specified by BUFFER-OR-NAME at the front of the buffer list and
do not make the window displaying it the most recently selected
one.

If the selected window is not dedicated, then:
* If FORCE-SAME-WINDOW is non-nil, signal an error if BUFFER-OR-NAME
  cannot be displayed in the selected window (e.g. if the selected
  window is minibuffer-only).
* If FORCE-SAME-WINDOW is nil, display BUFFER-OR-NAME in another
  window if it cannot be displayed in the selected window.</span>"
    (interactive
     (list (read-buffer-to-switch "<span class="quote">Switch to buffer: </span>") nil 'force-same-window))
    (let ((orig-buf    (current-buffer))
          (switch-buf  (if (not (window-dedicated-p (selected-window)))
                           (old-switch-to-buffer
                            buffer-or-name norecord force-same-window)
                         <span class="linecomment">;; If string, convert to buffer.</span>
                         <span class="linecomment">;; If nil, use `other-buffer'.</span>
                         (setq buffer-or-name  (if buffer-or-name
                                                   (get-buffer-create
                                                    buffer-or-name)
                                                 (other-buffer)))
                         (switch-to-buffer-other-window
                          buffer-or-name norecord))))
      (when (and (one-window-p t)
                 (not (eq switch-buf orig-buf)) <span class="linecomment">; Don't resize if same buffer.</span>
                 autofit-frames-flag
                 (fit-frame)))
      switch-buf)))


<span class="linecomment">;;; ;; REPLACES ORIGINAL in `window.el':</span>
<span class="linecomment">;;; ;; 1) Use `read-buffer' in interactive spec.</span>
<span class="linecomment">;;; ;; 2) Resize frame to fit sole window if `autofit-frames-flag'</span>
<span class="linecomment">;;; ;;    (unless BUFFER is already the `current-buffer').</span>
<span class="linecomment">;;; (when (fboundp 'pop-to-buffer-same-window) ; Emacs 24+.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; $$$$$$ Martin Rudalics's version, modified for frame fitting,</span>
<span class="linecomment">;;;        before Yidong Chong got into the act.</span>
<span class="linecomment">;;;   (defun pop-to-buffer-same-window (&optional buffer-or-name norecord label)</span>
<span class="linecomment">;;;     "Pop to buffer specified by BUFFER-OR-NAME in the selected window.</span>
<span class="linecomment">;;; Another window is used only if the buffer cannot be shown in the</span>
<span class="linecomment">;;; selected window, usually because it is dedicated to another buffer.</span>
<span class="linecomment">;;; Optional arguments BUFFER-OR-NAME, NORECORD, and LABEL are as for</span>
<span class="linecomment">;;; `pop-to-buffer'.</span>
<span class="linecomment">;;;</span>
<span class="linecomment">;;; Resize frame to fit sole window if `autofit-frames-flag' is non-nil.</span>
<span class="linecomment">;;; \(unless BUFFER is already the `current-buffer')."</span>
<span class="linecomment">;;;     (interactive</span>
<span class="linecomment">;;;      (list (read-buffer "Pop to buffer in selected window: "</span>
<span class="linecomment">;;;                         (if (fboundp 'another-buffer) ; In `misc-fns.el'.</span>
<span class="linecomment">;;;                             (another-buffer nil t)</span>
<span class="linecomment">;;;                           (other-buffer (current-buffer))))</span>
<span class="linecomment">;;;            current-prefix-arg))</span>
<span class="linecomment">;;;     ;; If string arg, convert to a buffer.  If nil, use `current-buffer'.</span>
<span class="linecomment">;;;     (setq buffer-or-name  (if buffer-or-name</span>
<span class="linecomment">;;;                               (get-buffer-create buffer-or-name)</span>
<span class="linecomment">;;;                             (current-buffer)))</span>
<span class="linecomment">;;;     (let ((orig-buf  (current-buffer)))</span>
<span class="linecomment">;;;       (prog1 (pop-to-buffer buffer-or-name 'same-window norecord label)</span>
<span class="linecomment">;;;         (and (one-window-p t)</span>
<span class="linecomment">;;;              (not (eq buffer-or-name orig-buf)) ; No resize if same buffer.</span>
<span class="linecomment">;;;              autofit-frames-flag</span>
<span class="linecomment">;;;              (fit-frame))))))</span>

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'autofit-frame)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; autofit-frame.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=autofit-frame.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_autofit-frame.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=autofit-frame.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=autofit-frame.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=autofit-frame.el">Administration</a></span><span class="time"><br /> Last edited 2012-12-28 20:47 UTC by <a class="author" title="from inet-rmmc01-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=autofit-frame.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
