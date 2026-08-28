-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Positive
-- Test Focus: minimal form: a single when branch without alternative_label — `when 0 =>` generates one concurrent signal assignment as a pipeline stage, verifying the minimal legal form of a case generate alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_alt_min_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity cgen_alt_min_ent;
architecture bh of cgen_alt_min_ent is
  subtype t_mode is integer range 0 to 0;
  constant mode : t_mode := 0;
begin
  gen_pipe : case mode generate
    when 0 =>
      dout <= din;
  end generate gen_pipe;
end architecture bh;
