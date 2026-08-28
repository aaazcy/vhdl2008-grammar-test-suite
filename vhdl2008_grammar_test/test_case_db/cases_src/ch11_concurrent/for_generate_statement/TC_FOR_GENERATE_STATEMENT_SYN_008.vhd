-- =============================================================
-- Case ID: TC_FOR_GENERATE_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_FOR_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: for_generate_statement ::= generate_label : for parameter_specification generate generate_statement_body end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: generate body with process statement — each iteration creates a process sensitive to its own slice of input
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fg_proc_ent is
  generic(N:integer:=4);
  port(a:in bit_vector(N-1 downto 0); y:out bit_vector(N-1 downto 0));
end entity;
architecture bh of fg_proc_ent is
  signal s_tmp:bit_vector(N-1 downto 0);
begin
  gen_proc: for i in 0 to N-1 generate
  begin
    p_bit: process(a(i))
    begin
      s_tmp(i) <= a(i);
    end process;
    y(i) <= s_tmp(i);
  end generate gen_proc;
end architecture bh;
