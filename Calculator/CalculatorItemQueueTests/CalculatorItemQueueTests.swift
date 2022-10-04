//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Ayaan on 2022/09/19.
//

import XCTest

extension Int: CalculateItem { }

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func testCalculatorItemQueue_주어진_1을_enqueue한_경우_head의_data는_1과_같다() {
        //given
        let input = 1
        
        //when
        sut.enqueue(input)
        
        //then
        XCTAssertEqual(input, sut.head?.data)
    }
    
    func testCalculatorItemQueue_주어진_1과_2를_순서대로_enqueue한_경우_head의_data는_1과_같고_tail의_data는_2와_같다() {
        //given
        let input = [1,2]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.head?.data)
        XCTAssertEqual(input[1], sut.tail?.data)
    }
    
    func testCalculatorItemQueue_주어진_1_2_3을_순서대로_enqueue한_경우_head의_data는_1과_같고_tail의_data는_3과_같다() {
        //given
        let input = [1,2,3]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.head?.data)
        XCTAssertEqual(input[2], sut.tail?.data)
    }
    
    func testCalculatorItemQueue_enqueue를_하지않고_dequeue한_경우_그_결과는_Nil이다() {
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func testCalculatorItemQueue_주어진_1을_enqueue한후_dequeue한_경우_그_결과는_1과_같다() {
        //given
        let input = 1
        
        //when
        sut.enqueue(input)
        let result: Int? = sut.dequeue()
        
        //then
        XCTAssertEqual(input, result)
    }
    
    func testCalculatorItemQueue_주어진_1_2_3을_순서대로_enqueue한후_dequeue한_경우_그_결과는_1과_같다() {
        //given
        let input = [1,2,3]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.dequeue())
    }
    
    func testCalculatorItemQueue_주어진_int_Array인_1_2_3을_요소를_순서대로_enqueue한후_input_Array의_요소의_수_만큼_dequeue한_경우_마지막_dequeue의_결과는_input_Array의_마지막_요소와_같다() {
        //given
        let input = [1,2,3]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        var result: Int?
        while !sut.isEmpty {
            result = sut.dequeue()
        }
        
        //then
        XCTAssertEqual(input.last, result)
    }
    
    func testCalculatorItemQueue_enqueue하지_않고_peek한_경우_그_결과는_Nil이다() {
        //given
        
        //when
        sut = CalculatorItemQueue<Int>()

        //then
        XCTAssertEqual(nil, sut.peek())
    }
    
    func testCalculatorItemQueue_주어진_int_Array인_1_2_3_4_5를_순서대로_enqueue한후_peek한_경우_그_결과는_주어진_int_Array의_첫번째_요소와_같다() {
        //given
        let input = [1,2,3,4,5]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input.first, sut.peek())
    }
    
    func testCalculatorItemQueue_주어진_int_Array인_1_2_3_4_5를_순서대로_enqueue한후_clear한_경우_head_와_tail_그리고_head_next는_Nil이다() {
        //given
        let input = [1,2,3,4,5]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        sut.clear()
        
        //then
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.head?.next)
        XCTAssertNil(sut.tail)
    }
}
