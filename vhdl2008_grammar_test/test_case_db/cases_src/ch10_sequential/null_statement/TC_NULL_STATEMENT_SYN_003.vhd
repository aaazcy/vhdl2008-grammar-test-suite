-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Positive
-- Test Focus: as the others branch in a case: `when others => null;` — verifying that null is often used as the default no-operation branch in a case statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity null_in_case_ent is
  port (
    opcode : in  integer range 0 to 3;
    result : out integer range 0 to 255
  );
end entity null_in_case_ent;

architecture decoder of null_in_case_ent is
  signal s_a : integer range 0 to 255 := 10;
  signal s_b : integer range 0 to 255 := 20;
begin
  process(opcode) is
  begin
    case opcode is
      when 0 => result <= s_a + s_b;
      when 1 => result <= s_a - s_b;
      when 2 => result <= s_a * 2;
      when others => null;  -- no operation for opcode 3
    end case;
  end process;
end architecture decoder;
