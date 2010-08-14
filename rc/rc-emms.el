(require 'emms-setup)
(require 'emms-player-mpd)
(emms-devel)

(setq emms-player-mpd-music-directory "/home/kavu/Music")
;(setq emms-player-mpd-server-name "localhost")
;(setq emms-player-mpd-server-port "6600")
(emms-player-mpd-connect)
  
(add-to-list 'emms-info-functions 'emms-info-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)
  
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86AudioStop>") 'emms-stop)
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)
  
;(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-track-description-function (lambda (track)
                                        (let ((artist (emms-track-get track 'info-artist))
                                              (album  (emms-track-get track 'info-album))
                                              (number (emms-track-get track 'info-tracknumber))
                                              (title  (emms-track-get track 'info-title)))
                                          (if (and artist album title)
                                              (if number
                                                  (format "%s - %s" artist title)
                                                (format "%s: %s - %s" artist title))
                                            (emms-track-simple-description track)))))

(global-set-key [f12] 'emms)

