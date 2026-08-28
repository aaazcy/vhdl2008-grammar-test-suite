-- =============================================================
-- Case ID: TC_CHOICE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: choice: element_simple_name as enumerated type values in selected signal assignment (with...select)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choice_syn5_ent is port(sel:in integer range 0 to 2; y:out integer); end entity;
architecture bh of choice_syn5_ent is
  type t_mode is (ADD_MODE, SUB_MODE, MUL_MODE);
  signal s_op:t_mode;
  signal s_a:integer:=10;
  signal s_b:integer:=3;
begin
  with sel select s_op <=
    ADD_MODE when 0,
    SUB_MODE when 1,
    MUL_MODE when 2;
  process(s_op, s_a, s_b) is
  begin
    case s_op is
      when ADD_MODE => y <= s_a + s_b;
      when SUB_MODE => y <= s_a - s_b;
      when MUL_MODE => y <= s_a * s_b;
    end case;
  end process;
end architecture bh;
