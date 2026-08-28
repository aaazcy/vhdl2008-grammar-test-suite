-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_MCS_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Choices in a matching case statement must match the type of the case expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: choice type mismatches the case expression type in matching case — in case? bv is when 0 =>, bv is bit_vector while choice 0 is integer, the choice type must match the case expression type
-- Expected Result: Triggers analysis error: can't match integer literal with type array type "bit_vector"
-- Dependencies: None
-- =============================================================
entity mcs_choice_mismatch is port(bv:in bit_vector(3 downto 0); y:out integer); end entity;
architecture vhdl2008 of mcs_choice_mismatch is
begin
  process(bv) begin
    case? bv is
      when 0 => y<=0;
      when others => y<=1;
    end case?;
  end process;
end architecture vhdl2008;
