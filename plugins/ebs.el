<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: ebs.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=ebs.el" /><link type="text/css" rel="stylesheet" href="/css/emacs.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: ebs.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=ebs.el" />
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
      title="Changes for ebs.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=ebs.el" />
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
<br /><span class="specialdays">Tunisia, Anniversary of the Independence of the Republic of Tunisia</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22ebs.el%22">ebs.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="download/ebs.el">Download</a></p><pre class="code"><span class="linecomment">;;; ebs.el --- easy buffer switch (ebs)</span>

<span class="linecomment">;; Copyright (C) 2004 Yan Tang</span>

<span class="linecomment">;; Author: Yan Tang &lt;tangyan@pku.org.cn&gt;</span>
<span class="linecomment">;; Maintainer: Yan Tang &lt;tangyan@pku.org.cn&gt;</span>
<span class="linecomment">;; Created: 9 Sep 2004</span>
<span class="linecomment">;; Version: $Id: ebs.el,v 1.2 2004/09/11 08:46:14 tangyan Exp $</span>
<span class="linecomment">;; Keywords: files convenience</span>

<span class="linecomment">;; This file is not part of GNU Emacs.</span>

<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License as</span>
<span class="linecomment">;; published by the Free Software Foundation; either version 2 of</span>
<span class="linecomment">;; the License, or (at your option) any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be</span>
<span class="linecomment">;; useful, but WITHOUT ANY WARRANTY; without even the implied</span>
<span class="linecomment">;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR</span>
<span class="linecomment">;; PURPOSE.  See the GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public</span>
<span class="linecomment">;; License along with this program; if not, write to the Free</span>
<span class="linecomment">;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,</span>
<span class="linecomment">;; MA 02111-1307 USA</span>

<span class="linecomment">;;; Commentary:</span>

<span class="linecomment">;; Ebs package offers two ways for switching buffers in GNU</span>
<span class="linecomment">;; Emacs/XEmacs, number indexed switch and cycle switch.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; In number indexed switch, buffer names in current buffer list will</span>
<span class="linecomment">;; be displayed in the echo area like this:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [1]buffa|[2]buffb|[3]buffc|[4]buffd|[5]buffe</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You can switch to whichever buffer you like by simply pressing the</span>
<span class="linecomment">;; number before its name.  Shortcut keys are provided for 2-bit numbers</span>
<span class="linecomment">;; ([10], [11], ...).  The default key mapping is as the following:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [10] -&gt; 0</span>
<span class="linecomment">;; [11] -&gt; q</span>
<span class="linecomment">;; [12] -&gt; w</span>
<span class="linecomment">;; [13] -&gt; e</span>
<span class="linecomment">;; [19] -&gt; o</span>
<span class="linecomment">;; [20] -&gt; p</span>
<span class="linecomment">;; [21] -&gt; a</span>
<span class="linecomment">;; ...</span>
<span class="linecomment">;; [39] -&gt; .</span>
<span class="linecomment">;; [40] -&gt; /</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Easy to remember and press?!  What about the buffer named</span>
<span class="linecomment">;; [41]buffodd?  Sorry, remember that you can ignore annoying buffers</span>
<span class="linecomment">;; by setting them in `ebs-exclude-buffer-regexps' so I don't think</span>
<span class="linecomment">;; you need to simultaneously edit more than 40 buffers.  If you</span>
<span class="linecomment">;; really need to the ability, crack this package yourself or cite</span>
<span class="linecomment">;; more than three real examples to persuade me.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Then, what's cycle switch and what the hell does it do?</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Cycle switch is much alike the classic alt-tab in windows.  That</span>
<span class="linecomment">;; is, when you press the default key binding C-tab more than once,</span>
<span class="linecomment">;; you will cycle the buffer list until arriving at your interested</span>
<span class="linecomment">;; buffer, like this:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Press C-tab once:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [1]buffa|[2]buffb|[3]buffc|[4]buffd|[5]buffe</span>
<span class="linecomment">;;          ~~~~~~~~ highlighted </span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Press C-tab twice:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [1]buffa|[2]buffb|[3]buffc|[4]buffd|[5]buffe</span>
<span class="linecomment">;;                   ~~~~~~~~</span>
<span class="linecomment">;; Press C-tab the third time:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [1]buffa|[2]buffb|[3]buffc|[4]buffd|[5]buffe</span>
<span class="linecomment">;;                            ~~~~~~~~</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Cycle switch is essential because when you want to switch to</span>
<span class="linecomment">;; buffers near the head of the buffer list, it is much more _direct_</span>
<span class="linecomment">;; and _convenient_ than number indexed switch.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; NOTES: When you press C-tab more than once (consecutively), ebs</span>
<span class="linecomment">;; will enter cycle switch mode.  That means number indexed switch are</span>
<span class="linecomment">;; temporarily disabled until you select your interested buffer and</span>
<span class="linecomment">;; do something in it.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; I design the behavior of ebs like this is because I think if you</span>
<span class="linecomment">;; want to use number index switch, after you first press C-tab you</span>
<span class="linecomment">;; _SHOULD_ press the buffer number.  If not, it indicates that you</span>
<span class="linecomment">;; intend to cycle buffer. Am I right?</span>

<span class="linecomment">;;; Installation:</span>

<span class="linecomment">;; Put this file on your emacs load path and add the following</span>
<span class="linecomment">;; three lines into your ~/.emacs startup file.</span>
<span class="linecomment">;; ---------------------------------------------------</span>
<span class="linecomment">;; (require 'ebs)</span>
<span class="linecomment">;; (ebs-initialize)</span>
<span class="linecomment">;; (global-set-key [(control tab)] 'ebs-switch-buffer)</span>
<span class="linecomment">;; ---------------------------------------------------</span>

<span class="linecomment">;;; Todo:</span>

<span class="linecomment">;; 1. Code structure & coding convention, enough comments, English</span>
<span class="linecomment">;; grammar&style.</span>
<span class="linecomment">;; 2. History info, recent used buffer list.</span>
<span class="linecomment">;; 3. Customization.</span>

<span class="linecomment">;;; Acknowledgment:</span>

<span class="linecomment">;; Crazycool@smth: </span>
<span class="linecomment">;;    the original idea of number index switch (probable).</span>
<span class="linecomment">;; Ann77@smth:</span>
<span class="linecomment">;;    the idea of waiting for a key after pressing control-tab.</span>
<span class="linecomment">;; David Ponce &lt;david@dponce.com&gt;:</span>
<span class="linecomment">;;    swbuff.el helps me a lot.</span>

<span class="linecomment">;;; Code:</span>

(defgroup ebs nil
  "<span class="quote">Easy Buffer Switch: Buffer switching with number index and recent history info.</span>"
  :group 'convenience)

(defcustom ebs-exclude-buffer-regexps '("<span class="quote">^ </span>"
					"<span class="quote">^\\*Messages\\*</span>"
					"<span class="quote">^\\*Buffer List\\*</span>"
					"<span class="quote">^\\*Completions\\*</span>")
  "<span class="quote">*List of regular expressions for annoying buffers.
The default setting ignores buffers whose name begin with a blank character.</span>"
  :group 'ebs
  :type '(repeat regexp))

(defcustom ebs-delay-time 1
  "<span class="quote">*Buffer list display time.</span>"
  :group 'ebs
  :type 'integer)

<span class="linecomment">;; Internal buffer name list.  It is not an essential variable in this</span>
<span class="linecomment">;; package, but holding this variable is much better for adding new</span>
<span class="linecomment">;; features, such as `history info'</span>
(defvar ebs-buffer-list nil)

<span class="linecomment">;; Cycle buffer temporary list.</span>
(defvar ebs-cycle-buffer-string nil)

<span class="linecomment">;; Highlight buffer _name_ range in `ebs-cycle-buffer-string'.</span>
(defvar ebs-highlight-buffer-start 0)
(defvar ebs-highlight-buffer-end 0)

<span class="linecomment">;; Buffer number counter.</span>
(defvar ebs-buffer-counter 0)

<span class="linecomment">;; Buffer switch state flag, `t' indicates number index switch and</span>
<span class="linecomment">;; `nil' indicates cycle switch.</span>
(defvar ebs-switch-state t)

(defun ebs-include-buffer-p (name)
  "<span class="quote">Return non-nil if buffer NAME can be included.
That is if NAME matches none of the `ebs-exclude-buffer-regexps'.</span>"
  (let ((rl ebs-exclude-buffer-regexps))
    (while (and rl (not (string-match (car rl) name)))
      (setq rl (cdr rl)))
    (null rl)))

(defun ebs-calc-buffer-list ()
  (setq ebs-buffer-list nil)
  (let ((bl (buffer-list)))
    (while bl
      <span class="linecomment">;; There is another elegent way to do this, see `swbuff.el'.</span>
      <span class="linecomment">;; What I have done here is checking each element manually in a loop.</span>
      (if (ebs-include-buffer-p (buffer-name (car bl)))
	  (setq ebs-buffer-list
		(append ebs-buffer-list (list (buffer-name (car bl))))))
      (setq bl (cdr bl)))))

(defun ebs-mapconcat-function (buffer)
  (setq ebs-buffer-counter (1+ ebs-buffer-counter))
  (let ((bf buffer))
    (concat "<span class="quote">[</span>" (format "<span class="quote">%d</span>" ebs-buffer-counter) "<span class="quote">]</span>" bf)))

(defun ebs-show-buffer-list ()
  "<span class="quote">Display the highlighted buffer _string_ in echo area.  NOTES: The
highlighted buffer list displayed in echo area is NOT a real list. It
is a string.  This function is only responsible for displaying the
initial highlight buffer string and the latter cycling effect is done
in `ebs-cycle-switch'.</span>"
  (let ((start 1)
	end)
    (setq ebs-buffer-counter 0)
    (setq ebs-cycle-buffer-string (mapconcat 'ebs-mapconcat-function
					     ebs-buffer-list
					     "<span class="quote">|</span>"))
    (cond ((= (length ebs-buffer-list) 1)
	   (setq start 0
		 end (length ebs-cycle-buffer-string)))
	  ((= (length ebs-buffer-list) 2)
	   (setq start (string-match "<span class="quote">\\[</span>" ebs-cycle-buffer-string start)
		 end (length ebs-cycle-buffer-string)))
	  (t
	   (setq start (string-match "<span class="quote">\\[</span>" ebs-cycle-buffer-string start)
		 end (string-match "<span class="quote">|</span>" ebs-cycle-buffer-string start))))
    (setq ebs-highlight-buffer-start
	  (1+ (string-match "<span class="quote">\\]</span>" ebs-cycle-buffer-string start))
	  ebs-highlight-buffer-end end)
    <span class="linecomment">;; Display the _inital_ highlight buffer list.</span>
    (add-text-properties start end '(face highlight)
			 ebs-cycle-buffer-string)
    (message ebs-cycle-buffer-string)))

(defun ebs-switch-buffer ()
  (interactive)
  (if ebs-switch-state
      (ebs-index-switch)
    (ebs-cycle-switch)))

(defun ebs-index-switch ()
  "<span class="quote">Number index buffer switch.</span>"
  (let (key-stroke keystroke-value keystroke-hash-value start end)
    <span class="linecomment">;; Caclculate internal buffer list.</span>
    (ebs-calc-buffer-list)
    (ebs-show-buffer-list)
    (cond ((= (length ebs-buffer-list) 1) <span class="linecomment">;; if there is only one buffer, do nothing.</span>
	   (run-with-idle-timer ebs-delay-time nil (lambda() (message nil))))
	  ((= (length ebs-buffer-list) 2) <span class="linecomment">;; if there are only two buffers, directly switch buffer.</span>
	   (progn 
	     (switch-to-buffer
	      (substring ebs-cycle-buffer-string
			 ebs-highlight-buffer-start
			 ebs-highlight-buffer-end))
	     (run-with-idle-timer ebs-delay-time nil (lambda() (message nil)))))
	  (t
	   (progn <span class="linecomment">;; buffer number &gt;= 3</span>
	     (switch-to-buffer
	      (substring ebs-cycle-buffer-string
			 ebs-highlight-buffer-start
			 ebs-highlight-buffer-end))
	     (setq keystroke (read-key-sequence-vector nil)
		   keystroke-value (aref keystroke 0))
	     (if (numberp keystroke-value)
		 (progn
		   (setq keystroke-hash-value
			 (gethash keystroke-value ebs-keyboard-hashtb))
		   (if (and keystroke-hash-value
			    (&lt;= keystroke-hash-value (length ebs-buffer-list)))
		       (switch-to-buffer
			(nth (- keystroke-hash-value 1) ebs-buffer-list))))
	       <span class="linecomment">;; If user presses "C-tab" consequently, we will enter cycle mode.</span>
	       (if (equal (key-binding keystroke) 'ebs-switch-buffer)
		   (progn
		     (setq ebs-switch-state nil)
		     (ebs-cycle-switch)))))))
    ))

(defun ebs-cycle-switch ()
  "<span class="quote">Cycle buffer switch.  NOTES: Buffer list can NEVER change in this
mode, so we just use the fixed buffer string.</span>"
  (let ((start (string-match "<span class="quote">\\[</span>" ebs-cycle-buffer-string
			     ebs-highlight-buffer-end))
	end)
    (unless start
      (setq start 0))
    (setq end (string-match "<span class="quote">|</span>" ebs-cycle-buffer-string start))
    (unless end
      (setq end (length ebs-cycle-buffer-string)))
    (remove-text-properties 0 (length ebs-cycle-buffer-string)
			    '(face highlight)
 			    ebs-cycle-buffer-string)
    <span class="linecomment">;; Highlight forward one step.</span>
    (add-text-properties start end '(face highlight)
 			 ebs-cycle-buffer-string)
    (setq ebs-highlight-buffer-start
	  (1+ (string-match "<span class="quote">\\]</span>" ebs-cycle-buffer-string start))
	  ebs-highlight-buffer-end end)    
    (message ebs-cycle-buffer-string)
    (switch-to-buffer (substring ebs-cycle-buffer-string
				 ebs-highlight-buffer-start
				 ebs-highlight-buffer-end))  
    (run-with-idle-timer ebs-delay-time nil (lambda() (message nil)))
    (add-hook 'pre-command-hook 'ebs-pre-command-hook)))

(defun ebs-pre-command-hook ()
  (unless (memq this-command '(ebs-switch-buffer))
    (progn <span class="linecomment">;; Go back to number index mode and cancel pre-command-hook.</span>
      (setq ebs-switch-state t)
      (remove-hook 'pre-command-hook 'ebs-pre-command-hook))))

(defvar ebs-keyboard-hashtb (make-hash-table))

(defun ebs-initialize ()
  <span class="linecomment">;; init keyboard hash table</span>
  <span class="linecomment">;; 1 -&gt; 1, 2 -&gt; 2, 9 -&gt; 9, 0 -&gt; 10,</span>
  <span class="linecomment">;; q -&gt; 11, w -&gt; 12, p -&gt; 20,</span>
  <span class="linecomment">;; a -&gt; 21, s -&gt; 22, ; -&gt; 30,</span>
  <span class="linecomment">;; z -&gt; 31, x -&gt; 32, / -&gt; 40.</span>
  <span class="linecomment">;; You can change the default hash table as you like, ;-)</span>
  <span class="linecomment">;; ===========================================================</span>
  <span class="linecomment">;; ASCII Table:</span>
  <span class="linecomment">;; 1-49, 2-50, 3-51, 4-52, 5-53, 6-54, 7-55, 8-56, 9-57, 0-48,</span>
  <span class="linecomment">;; a-97, ... , z-122,</span>
  <span class="linecomment">;; ;-59, ,-44, .-46, /-47.</span>
  (puthash 49 1 ebs-keyboard-hashtb)
  (puthash 50 2 ebs-keyboard-hashtb)
  (puthash 51 3 ebs-keyboard-hashtb)
  (puthash 52 4 ebs-keyboard-hashtb) 
  (puthash 53 5 ebs-keyboard-hashtb)
  (puthash 54 6 ebs-keyboard-hashtb)
  (puthash 55 7 ebs-keyboard-hashtb)
  (puthash 56 8 ebs-keyboard-hashtb)
  (puthash 57 9 ebs-keyboard-hashtb)
  (puthash 49 1 ebs-keyboard-hashtb)
  (puthash 48 0 ebs-keyboard-hashtb)
  (puthash 113 11 ebs-keyboard-hashtb)
  (puthash 119 12 ebs-keyboard-hashtb)
  (puthash 101 13 ebs-keyboard-hashtb)
  (puthash 114 14 ebs-keyboard-hashtb)
  (puthash 116 15 ebs-keyboard-hashtb)
  (puthash 121 16 ebs-keyboard-hashtb)
  (puthash 117 17 ebs-keyboard-hashtb)
  (puthash 105 18 ebs-keyboard-hashtb)
  (puthash 111 19 ebs-keyboard-hashtb)
  (puthash 112 20 ebs-keyboard-hashtb)
  (puthash 97 21 ebs-keyboard-hashtb)
  (puthash 115 22 ebs-keyboard-hashtb)
  (puthash 100 23 ebs-keyboard-hashtb)
  (puthash 102 24 ebs-keyboard-hashtb)
  (puthash 103 25 ebs-keyboard-hashtb)
  (puthash 104 26 ebs-keyboard-hashtb)
  (puthash 106 27 ebs-keyboard-hashtb)
  (puthash 107 28 ebs-keyboard-hashtb)
  (puthash 108 29 ebs-keyboard-hashtb)
  (puthash 59 30 ebs-keyboard-hashtb)
  (puthash 122 31 ebs-keyboard-hashtb)
  (puthash 120 32 ebs-keyboard-hashtb)
  (puthash 99 33 ebs-keyboard-hashtb)
  (puthash 118 34 ebs-keyboard-hashtb)
  (puthash 98 35 ebs-keyboard-hashtb)
  (puthash 110 36 ebs-keyboard-hashtb)
  (puthash 109 37 ebs-keyboard-hashtb)
  (puthash 44 38 ebs-keyboard-hashtb)
  (puthash 46 39 ebs-keyboard-hashtb)
  (puthash 47 40 ebs-keyboard-hashtb))

(provide 'ebs)

<span class="linecomment">;;; ebs.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=ebs.el;missing=de_en_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_ebs.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=ebs.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=ebs.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=ebs.el">Administration</a></span><span class="time"><br /> Last edited 2008-09-05 05:09 UTC by <a class="author" title="from c-69-181-100-12.hsd1.ca.comcast.net" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=ebs.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
