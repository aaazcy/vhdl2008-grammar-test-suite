-- =============================================================
-- Case ID: TC_LABEL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Positive
-- Test Focus: label: identifier on variable assignment statement inside process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity label_syn4_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of label_syn4_ent is
  signal s_out:integer:=0;
begin
  process(a,b) is
    variable v_tmp:integer;
  begin
    COMPUTE: v_tmp := a + b;
    STORE: s_out <= v_tmp;
  end process;
  y <= s_out;
end architecture bh;
