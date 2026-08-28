-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement ::= for_generate_statement | if_generate_statement | case_generate_statement
-- Case Type: Positive
-- Test Focus: nested for-if generate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_spc3_ent is port(a:in bit_vector(3 downto 0); y:out bit_vector(3 downto 0)); end entity;
architecture bh of gen_spc3_ent is begin
  gen_outer:for i in 0 to 3 generate
    gen_inner:if i mod 2=0 generate
      y(i)<=a(i);
    end generate;
  end generate;
end architecture bh;
