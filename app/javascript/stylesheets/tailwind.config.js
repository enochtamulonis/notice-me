module.exports = {
    purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb',
    './app/javascript/**/*.js',
  ],

  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      minHeight: {
        '20': '5rem',
        'screen': '100vh',
      }
    },
  },
  variants: {
    extend: {},
  },
    plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],

}
