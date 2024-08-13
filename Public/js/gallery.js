//
//  gallery.js
//  enzottic.me.m
//
//  Created by Tyler McCormick on 8/12/24.
//

import { zoom } from 'https://cdn.jsdelivr.net/npm/@nishanths/zoom.js@4.4.0/+esm'

let grid = document.querySelector('.grid')
var masonry = new Masonry(grid, {
    itemSelector: '.grid-item',
    columnWidth: '.grid-sizer',
    percentPosition: true,
    gutter: 10
})

imagesLoaded(grid).on('progress', function () {
    masonry.layout()
    let imgs = document.querySelectorAll('img')
    imgs.forEach(img => {
        img.classList.add('zoom-cursor')
        img.addEventListener('click', () => { zoom(img) })
    })
})
