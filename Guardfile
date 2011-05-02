# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{app/.+\.(erb|haml)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{public/stylesheets/compiled/.+\.css})
  watch(%r{config/locales/.+\.yml})
end

guard 'compass' do
  watch('^app/stylesheets/(.*)\.s[ac]ss')
end
