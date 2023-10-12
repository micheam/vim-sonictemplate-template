//
//  {{_name_}}.swift
//
//  Created by {{_input_:author}} on {{_expr_:strftime("%Y/%m/%d")}}.
//

import SwiftUI

struct {{_input_:struct:{{_name_}}}}: View {
    var body: some View {
        Text("Hello, World!")
    }
}

enum {{_input_:struct:{{_name_}}}}_Previews: PreviewProvider {
    static var previews: some View {
        {{_input_:struct:{{_name_}}}}()
    }
}
