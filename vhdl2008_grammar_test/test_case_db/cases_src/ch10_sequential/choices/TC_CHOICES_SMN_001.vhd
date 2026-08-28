-- =============================================================
-- Case ID: TC_CHOICES_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CHOICES_COVERAGE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Choices must cover all possible values of case expression type
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: choices cover only 0 and 1, missing 2 and 3 for integer range 0 to 3
-- Expected Result: Triggers semantic error: choices do not cover all values
-- Dependencies: None
-- =============================================================
entity choices_sem1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choices_sem1_ent is
begin
  process(sel) begin
    case sel is when 0=>y<=0; when 1=>y<=10; end case;
  end process;
end architecture bh;
