import Foundation

struct Event {
    var startDate: Date
}

struct Calendar {
    var events: [Event] = []
    
    mutating func insert(_ event: Event) {
        events.append(event)
        events.sort { (e1, e2) -> Bool in
            e1.startDate < e2.startDate
        }
    }
}

struct SortedArray<Element> {
    var elements: [Element]
    let areInIncreasingOrder: (Element, Element) -> Bool
    
    init<S: Sequence>(unsorted: S, areInIncreasingOrder: @escaping (Element, Element) -> Bool) where S.Iterator.Element == Element {
        elements = unsorted.sorted(by: areInIncreasingOrder)
        self.areInIncreasingOrder = areInIncreasingOrder
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        elements.sort(by: areInIncreasingOrder)
    }
}

extension SortedArray: Collection {
    var startIndex: Int {
        return elements.startIndex
    }
    
    var endIndex: Int {
        return elements.endIndex
    }
    
    subscript(index: Int) -> Element {
        return elements[index]
    }
    
    func index(after i: Int) -> Int {
        return elements.index(after: i)
    }
}

extension SortedArray {
    func min() -> Element? {
        return elements.first
    }
}

extension SortedArray where Element: Comparable {
    init<S: Sequence>(unsorted: S) where S.Iterator.Element == Element {
        self.init(unsorted: unsorted, areInIncreasingOrder: <)
    }
}
