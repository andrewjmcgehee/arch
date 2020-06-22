syn match texInputFile "\\cite\s*\(\[.*\]\)\={.\{-}}"
     \ contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInputFile "\\supercite\s*\(\[.*\]\)\={.\{-}}"
     \ contains=texStatement,texInputCurlies,texInputFileOpt
