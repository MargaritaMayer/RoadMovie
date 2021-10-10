import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_4/models/pointcategory.dart';

class UtilsPoints {
  static List<PointCategory> getPoints(String number) {
    if (number == '1') {
      return [
        PointCategory(
            name: 'Zemlyanoy Val, 53',
            screenshot: 'pokrovskie1',
            description:
                'The main manor house, carriage barn, stables, some outbuildings, a ramp, two rotunda arbors and this grotto, around which the final scene in the hospital unfolded, have survived to this day.',
            movieinfo:
                'Leonid Zorin, author of the play, copied the image of Margarita Pavlovna from his translator from the French',
            numberOfPointColor: '3',
            coordinates: LatLng(55.75272615341363, 37.65665291369295)),
        PointCategory(
            name: 'Yauza embankment',
            screenshot: 'pokrovskie2',
            description:
                'On the edge of the hill leading to the Yauza embankment were installed two eight-column pavilions-rotundas. In one of the shots we see one of these arbors.',
            movieinfo:
                'Leonid Zorin brought himself up as Kostya Romin, the protagonist of "The Pokrovskie Gate" and several other plays.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.82875656783303, 37.69921625006431)),
        PointCategory(
            name: 'Kazakov, 15',
            screenshot: 'pokrovskie3',
            description:
                'Khobotov meets Lyudochka after work. House number 15 on Kazakov Street. In this house is the State University of Land Management.',
            movieinfo:
                'The management of Mosfilm considered the script frivolous and ideologically flawed, and then Kozakov decided to make a TV movie.',
            numberOfPointColor: '1',
            coordinates: LatLng(55.763747918159524, 37.66625190881735)),
        PointCategory(
            name: 'Chistoprudny Boulevard,14',
            screenshot: 'pokrovskie4',
            description:
                'Khobotov and Lyudochka get into a streetcar. Behind the streetcar, we see house number 14 on Chistoprudny Boulevard.',
            movieinfo:
                'The roles were played by actors Anatoly Ravikovich, Inna Ulyanova and Victor Bortsov, little-known to moviegoers.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.76031918695749, 37.644779765277555)),
        PointCategory(
            name: 'Sea Aquarium',
            screenshot: 'pokrovskie5',
            description:
                'This is one of the most beautiful houses in Moscow, it is called the "Revival House of the Church of the Trinity on Gryazekh". Now there is a very interesting museum in this house - the "Sea Aquarium" with micro sharks.',
            movieinfo:
                'The mysterious Savransky was played by stuntman, stunt director and motorcycle racer Leonid Mashkov.',
            numberOfPointColor: '3',
            coordinates: LatLng(55.76004353096595, 37.64455894438035)),
        PointCategory(
            name: 'Chistoprudny Boulevard,14 ',
            screenshot: 'pokrovskie6',
            description:
                'Khobotov and Lyudochka get into a streetcar. Behind the streetcar, we see house number 14 on Chistoprudny Boulevard.',
            movieinfo:
                'The roles were played by actors Anatoly Ravikovich, Inna Ulyanova and Victor Bortsov, little-known to moviegoers.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.76031918695749, 37.644779765277555)),
        PointCategory(
            name: 'Customs Bridge on the Yauza River',
            screenshot: 'pokrovskie7',
            description: 'This bridge offers a beautiful view of the park.',
            movieinfo:
                'In his joke: "A very ancient city has been discovered at the bottom of Lake Titicaca, so goodbye, dear, I am going away for a long time," Kostic predicted the future. In 2000, archaeologists discovered traces of a sunken city at the bottom of the lake.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.752640761697535, 37.67274402903654)),
        PointCategory(
            name: 'Andronicus viaduct',
            screenshot: 'pokrovskie8',
            description:
                'In both photos you can see Andronikov viaduct from behind. Behind it is the Spaso Andronikov Monastery.The comedy "The Pokrovskie Gate" saw the light in 1982 and caused contradictory emotions in the audience.',
            movieinfo:
                'The comedy "The Pokrovskie Gate" saw the light in 1982 and caused contradictory emotions in the audience.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75082424811412, 37.67054690020058)),
        PointCategory(
            name: 'Bolshoi Vatin Alley',
            screenshot: 'pokrovskie9',
            description:
                'Rita takes Kostya to meet her parents at the high-rise on Kotelnicheskaya Embankment. Bolshoi Vatin Lane. Curiously enough, they are walking in the right direction.',
            movieinfo:
                'On central television, the comedy came only through the inattention of Sergei Lapin deputy.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.74746397611906, 37.645279023482715)),
      ];
    }
    if (number == '2') {
      return [
        PointCategory(
            name: 'Research Hall of the Lenin Library',
            screenshot: 'moskva1',
            description:
                'The halls of the Lenin Library are shown in full glory in the film, especially reading room #3.',
            movieinfo:
                'Vitaly Solomin, Vyacheslav Tikhonov, Oleg Efremov, Leonid Dyachkov and many others tried for the role of Gosha, but the director saw none of them as an intelligent locksmith.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75188480177088, 37.60891161369299)),
        PointCategory(
            name: 'Gogolevsky Boulevard.',
            screenshot: 'moskva2',
            description:
                'Behind the heroes backs you can clearly see a house with columns, the brightest example of Russian classical architecture of the 18th century.',
            movieinfo:
                'About Gosha screenwriter said: "This is my dream and my complexes, I would like women to see me like this.',
            numberOfPointColor: '3',
            coordinates: LatLng(55.74783143829264, 37.60021164252875)),
        PointCategory(
            name: 'Triumphal Square',
            screenshot: 'moskva3',
            description:
                'It is known that the film starred the famous poet Andrei Voznesensky, who played himself reciting poetry near the monument to Mayakovsky on Triumphal Square.',
            movieinfo:
                'Originally the movie was an hour longer. According to the script, Gosha and Kolya are at singing "A Young Cossack Walks the Don," but in the movie they are modestly cutting up taranka.',
            numberOfPointColor: '3',
            coordinates: LatLng(55.77008928338199, 37.59538325417068)),
        PointCategory(
            name: 'State Film Actor Theater',
            screenshot: 'moskva4',
            description:
                'The scene of the parade of actors at the French Film Festival was filmed in the current building of the State Theater of the Actor on Povarskaya Street. ',
            movieinfo:
                'The building was built in 1931-1935 according to the design of the legendary Soviet architects Vesnin brothers in the best traditions of constructivism. ',
            numberOfPointColor: '2',
            coordinates: LatLng(55.7570807184042, 37.58660972109795)),
      ];
    }

    if (number == '3') {
      return [
        PointCategory(
            name: 'Research Hall of the Lenin Library',
            screenshot: 'moskva1',
            description:
                'The halls of the Lenin Library are shown in full glory in the film, especially reading room #3.',
            movieinfo:
                'Vitaly Solomin, Vyacheslav Tikhonov, Oleg Efremov, Leonid Dyachkov and many others tried for the role of Gosha, but the director saw none of them as an intelligent locksmith.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75188480177088, 37.60891161369299)),
      ];
    }
    if (number == '4') {
      return [
        PointCategory(
            name: 'Research Hall of the Lenin Library',
            screenshot: 'moskva1',
            description:
                'The halls of the Lenin Library are shown in full glory in the film, especially reading room #3.',
            movieinfo:
                'Vitaly Solomin, Vyacheslav Tikhonov, Oleg Efremov, Leonid Dyachkov and many others tried for the role of Gosha, but the director saw none of them as an intelligent locksmith.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75188480177088, 37.60891161369299))
      ];
    }
    if (number == '5') {
      return [
        PointCategory(
            name: 'Research Hall of the Lenin Library',
            screenshot: 'moskva1',
            description:
                'The halls of the Lenin Library are shown in full glory in the film, especially reading room #3.',
            movieinfo:
                'Vitaly Solomin, Vyacheslav Tikhonov, Oleg Efremov, Leonid Dyachkov and many others tried for the role of Gosha, but the director saw none of them as an intelligent locksmith.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75188480177088, 37.60891161369299))
      ];
    }
    if (number == '6') {
      return [
        PointCategory(
            name: 'Research Hall of the Lenin Library',
            screenshot: 'moskva1',
            description:
                'The halls of the Lenin Library are shown in full glory in the film, especially reading room #3.',
            movieinfo:
                'Vitaly Solomin, Vyacheslav Tikhonov, Oleg Efremov, Leonid Dyachkov and many others tried for the role of Gosha, but the director saw none of them as an intelligent locksmith.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75188480177088, 37.60891161369299))
      ];
    }
    if (number == '7') {
      return [
        PointCategory(
            name: 'Research Hall of the Lenin Library',
            screenshot: 'moskva1',
            description:
                'The halls of the Lenin Library are shown in full glory in the film, especially reading room #3.',
            movieinfo:
                'Vitaly Solomin, Vyacheslav Tikhonov, Oleg Efremov, Leonid Dyachkov and many others tried for the role of Gosha, but the director saw none of them as an intelligent locksmith.',
            numberOfPointColor: '2',
            coordinates: LatLng(55.75188480177088, 37.60891161369299))
      ];
    }
  }
}
