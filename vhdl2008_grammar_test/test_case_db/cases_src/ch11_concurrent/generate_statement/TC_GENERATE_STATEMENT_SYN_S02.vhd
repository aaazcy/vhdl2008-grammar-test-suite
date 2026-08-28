-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement ::= for_generate_statement | if_generate_statement | case_generate_statement
-- Case Type: Positive
-- Test Focus: if generate with else branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spc2_ent is
  generic(HAS_PIPELINE:boolean:=true);
  port(a:in bit; y:out bit);
end entity;
architecture bh of gen_spc2_ent is
  signal s_pipe:bit_vector(2 downto 0):=(others=>'0');
begin
  gen_pipe:if HAS_PIPELINE generate
    process begin wait for 1 ns; s_pipe(0)<=a;
      for i in 0 to 1 loop s_pipe(i+1)<=s_pipe(i); end loop;
    end process;
    y<=s_pipe(2);
  else generate
    y<=a;
  end generate gen_pipe;
end architecture bh;
