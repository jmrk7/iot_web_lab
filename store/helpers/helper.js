export const errorHandler = function (mutationName, moduleName, error) {
  throw new Error(`CANN'T ${mutationName} in action ${moduleName}`, error)
}
