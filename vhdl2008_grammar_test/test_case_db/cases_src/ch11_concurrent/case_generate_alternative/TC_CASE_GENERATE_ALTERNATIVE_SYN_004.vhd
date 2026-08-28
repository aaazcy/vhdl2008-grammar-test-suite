-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Positive
-- Test Focus: a when branch with multiple choice values (choices) — several discrete choice values are combined in a single `when` branch, verifying that alternative choice supports a list of multiple choice values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_alt_mchoice_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity cgen_alt_mchoice_ent;
architecture bh of cgen_alt_mchoice_ent is
  constant width_sel : integer := 1;
  signal s_stage : bit_vector(15 downto 0);
begin
  gen_width : case width_sel generate
    when 1 | 3 | 5 =>
      s_stage(7 downto 0) <= din;
      dout <= s_stage(7 downto 0);
    when 2 | 4 =>
      s_stage(15 downto 0) <= din & din;
      dout <= s_stage(15 downto 8);
    when others =>
      dout <= din;
  end generate gen_width;
end architecture bh;
