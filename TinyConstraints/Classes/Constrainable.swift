//
//    MIT License
//
//    Copyright (c) 2017 Robert-Hein Hooijmans <rh.hooijmans@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

#if os(OSX)
    import AppKit
    
    extension View: Constrainable {
        
        public func prepareForLayoutIfNeeded() {
            
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
#else
    import UIKit
    
    extension View: Constrainable {
        
        public func prepareForLayoutIfNeeded() {
            
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        public func addAsSubview(to view: Constrainable,withEdges directions: [ConstraintDirection]) {
            guard let view = view as? UIView else {return}
            view.addSubview(self)
            edges(directions, to: view)
        }
        
        public func addAsSubviewWithEdges(to view: Constrainable) {
            addAsSubview(to: view, withEdges: [.top, .bottom, .leading, .trailing])
        }
        
        func insertAsSubview(to view: Constrainable, withEdges directions: [ConstraintDirection], at index: Int) {
            guard let view = view as? UIView else {return}
            view.insertSubview(self, at: index)
            edges(directions, to: view)
        }
        
        func insertAsSubviewWithEdges(to view: Constrainable, at index: Int) {
            insertAsSubview(to: view, withEdges: [.top, .bottom, .leading, .trailing], at: index)
        }
        
        public func addSubview(to view: Constrainable, withEdges directions: [ConstraintDirection]) {
            guard let view = view as? UIView else {return}
            addSubview(view)
            view.edges(directions, to: self)
        }
        
        public func addSubviewWithEdges(to view: Constrainable) {
            addSubview(to: view, withEdges: [.top, .bottom, .leading, .trailing])
        }
        
        func insertSubview(to view: Constrainable, withEdges directions: [ConstraintDirection], at index: Int) {
            guard let view = view as? UIView else {return}
            insertSubview(view, at: index)
            view.edges(directions, to: self)
        }
        
        func insertSubviewWithEdges(to view: Constrainable, at index: Int) {
            insertSubview(to: view, withEdges: [.top, .bottom, .leading, .trailing], at: index)
        }
        
    }
#endif



extension LayoutGuide: Constrainable {
    public func prepareForLayoutIfNeeded() {}
}

public protocol Constrainable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    
    func prepareForLayoutIfNeeded()
}
