import SwiftUI

struct ResultsDetailView: View {

    @State var eventData: [String : String]
    
    var body: some View {
        ZStack {
            Image("")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
        VStack{
            HStack(spacing: UIScreen.main.bounds.width/13){
                VStack {
                    Image("LMLogo")
                        .resizable()
                        .frame(width: (UIScreen.main.bounds.width/5), height: (UIScreen.main.bounds.width/5))
                Text("Lower Merion")

                    .font(Constants.LargeFont)
                    .foregroundColor(.black)

                }
                if eventData["scorelm"] ?? "0" > eventData["scoreOpponent"] ?? "0" {
                    VStack(spacing: 2){
                    Text(eventData["scorelm"] ?? "?")
                        .foregroundColor(.black)
                        .font(Constants.GameScoreFont)
                    Rectangle()
                            .frame(width: UIScreen.main.bounds.width/10, height: 2)
                            .foregroundColor(.black)
                    }

                    Text(eventData["scoreOpponent"] ?? "?")
                        .foregroundColor(.black.opacity(0.4))
                        .font(Constants.GameScoreFont)
                }

                else {
                    Text(eventData["scorelm"] ?? "?")
                        .foregroundColor(.black.opacity(0.4))
                        .font(Constants.GameScoreFont)

                    VStack(spacing: 3){

                    Text(eventData["scoreOpponent"] ?? "?")
                        .foregroundColor(.black)
                        .font(Constants.GameScoreFont)

                        Rectangle()
                                .frame(width: UIScreen.main.bounds.width/10, height: 2)
                                .foregroundColor(.black)

                    }
                }

                VStack {
                Image(eventData["name"] ?? "badLogo")
                    .resizable()
                    .frame(width: (UIScreen.main.bounds.width/5), height: (UIScreen.main.bounds.width/5))

                Text("\(eventData["name"] ?? "?")")
                    .font(Constants.LargeFont)
                    .foregroundColor(.black)

                }
            }

            VStack {
                HStack {
                    Image(systemName: "calendar")
                Text("Date:   \(eventData["date"] ?? "04/12/23")")
                    .font(Constants.LargeFont)
                    .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "clock")
                Text("Time:   \(eventData["time"] ?? "7:00")")
                    .font(Constants.LargeFont)
                    .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "dollarsign.circle")
                    Text("Admission Cost:   \(eventData["price"] ?? "free") ")
                        .font(Constants.LargeFont)
                        .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "person.3")
                    Text("Theme:   \(eventData["theme"] ?? "None")")
                        .font(Constants.LargeFont)
                        .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Location:   \(eventData["location"] ?? " Lower Merion High School")")
                        .font(Constants.LargeFont)
                        .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
        }
    }
        }.padding(.vertical, 50)

        }
}



struct ResultsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDetailView(eventData : [:])
    }
}
