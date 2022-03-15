import SwiftUI

extension Image {
    /**
     Show PDF Vector Image to Image() - #fileLiteral(resourceName: "yourPDF.pdf")
     */
    public init?(pdf url: URL) {
        
        guard 
            let doc  = CGPDFDocument(url as CFURL),
            let page = doc .page(at: 1) 
        else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        
        let img = renderer.image { ctx in
            UIColor.clear.set()
            ctx.fill(pageRect)
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            ctx.cgContext.drawPDFPage(page)
        }
        
        self = Image(uiImage: img)
    }
}
