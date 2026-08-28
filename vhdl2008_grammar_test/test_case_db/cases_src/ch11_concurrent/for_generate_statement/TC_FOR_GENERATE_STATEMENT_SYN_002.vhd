-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: parameter_specification with enumeration type range — for-generate iterating over discrete enum values (t_state: IDLE,READ,WRITE,DONE), each iteration drives a concurrent assignment indexed by enum
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_enum_ent is
  port(ctrl:out bit_vector(3 downto 0));
end entity;
architecture bh of fg_enum_ent is
  type t_state is (IDLE, READ, WRITE, DONE);
  signal s_state:bit_vector(3 downto 0);
begin
  gen_state: for st in t_state generate
    s_state(t_state'pos(st)) <= '1' when st = READ else '0';
  end generate;
  ctrl <= s_state;
end architecture bh;
