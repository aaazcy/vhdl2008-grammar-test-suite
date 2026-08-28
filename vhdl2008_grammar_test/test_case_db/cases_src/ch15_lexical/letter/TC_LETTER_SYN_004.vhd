-- =============================================================
-- Case ID: TC_LETTER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Positive
-- Test Focus: Mixed-case letters as enumeration literals in an enumeration type — enumeration values consist of letters, verifying the core role of letter in identifiers
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity let_enum_literal is
  port (
    state_out : out integer
  );
end entity let_enum_literal;

architecture rtl of let_enum_literal is
  type T_FSM is (Idle, Run, Stop, Error);
  signal s_state : T_FSM := Idle;
begin
  process(s_state)
  begin
    case s_state is
      when Idle  => state_out <= 0;
      when Run   => state_out <= 1;
      when Stop  => state_out <= 2;
      when Error => state_out <= 3;
    end case;
  end process;
end architecture rtl;
