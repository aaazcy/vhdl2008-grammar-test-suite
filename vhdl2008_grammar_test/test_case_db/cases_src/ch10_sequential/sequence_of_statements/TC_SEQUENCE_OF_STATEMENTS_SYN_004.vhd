-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Three statements including an if-statement: variable assignment -> if conditional -> signal assignment, verifying if as a sequential_statement in a seq
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sos_syn4_ent is port(a,b:in integer; sel:in bit; y:out integer); end entity;
architecture bh of sos_syn4_ent is
begin
  process(a,b,sel) is
    variable v_tmp : integer;
  begin
    v_tmp := 0;
    if sel = '1' then v_tmp := a + b; else v_tmp := a - b; end if;
    y <= v_tmp;
  end process;
end architecture bh;
