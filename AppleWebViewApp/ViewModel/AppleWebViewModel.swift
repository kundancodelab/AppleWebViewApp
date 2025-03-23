import Foundation

struct AppleWebViewModel {
    
    let webLinks: [String: URL] = [
        "Main": URL(string: "https://www.apple.com/in/")!,
        "Home": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "Store": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "Mac": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "iPad": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "iPhone": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "Watch": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "AirPods": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "TV & Home": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "Entertainment": URL(string: "https://www.apple.com/in/store?cid=aos-IN-kwgo-brand")!,
        "Support": URL(string: "https://support.apple.com/en-in?cid=gn-ols-home-hp-tab")!,
        "Cart": URL(string: "https://support.apple.com/en-in?cid=gn-ols-home-hp-tab")!
    ]
    
    func getURL(for key: String) -> URL? {
        return webLinks[key]
    }
    
}
