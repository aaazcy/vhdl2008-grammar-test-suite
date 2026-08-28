-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if [ alternative_label : ] condition generate generate_statement_body { elsif [ alternative_label : ] condition generate generate_statement_body } [ else [ alternative_label : ] generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: Minimal if generate——`if DEBUG_MODE generate` has only one branch with no elsif/else and a generic boolean condition, verifying that the minimal if generate contains only a single conditionally compiled generate body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ifgen_simple_ent is
  generic(DEBUG_MODE : boolean := false);
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity ifgen_simple_ent;
architecture bh of ifgen_simple_ent is
begin
  gen_dbg : if DEBUG_MODE generate
    dout <= not din;
  end generate gen_dbg;
end architecture bh;
