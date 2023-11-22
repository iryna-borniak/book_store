const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        'regal-blue': 'rgba(255, 255, 255, 0.95)',
        'regal-gray': 'rgba(0, 0, 0, 0.1)',
        'regal-light': 'rgb(244, 244, 244)',
      },
      backgroundImage: {
        'banner-gradient': 'linear-gradient(90deg, #0045ff, #16dfda)',
        'show-gradient': 'linear-gradient(180deg, #f7f7f7, #ffffff)',
        'main-banner-gradient': 'linear-gradient(135deg, #0071eb 30%, #14d4d8)',
        'ring': "url('ring.svg')",
      },      
      width: {
        'show-title-width': 'calc(66.666667% - 40px)',
        'book-info-width': 'calc(100% - 159px)',
        '580': '580px',                
      },
      maxWidth: {
        'content-md': '980px',
      },
      height: {
        '600': '600px',
      },
      inset: {
        '50': '50px',
        '120': '120px',
      },           
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
