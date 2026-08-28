-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Rule Description: Each branch of a case generate statement elaborates independently — only the selected alternative's concurrent statements are active; unselected alternatives are not elaborated
-- Case Type: Positive
-- Test Focus: case generate activates only the selected branch — two when branches each declare signals of different type widths, and the signal of the selected branch drives the output, verifying that unselected alternatives take no part in elaboration and cause no conflict
-- Expected Result: Compiles successfully; only the matching alternative is elaborated
-- Dependencies: None
-- =============================================================
entity cgen_alt_sem2_ent is
  generic(width : integer := 0);
  port(clk : in bit; din8 : in bit_vector(7 downto 0); din16 : in bit_vector(15 downto 0); dout : out bit_vector(31 downto 0));
end entity cgen_alt_sem2_ent;
architecture bh of cgen_alt_sem2_ent is
begin
  gen_wide : case width generate
    when 0 =>
      signal s_buf : bit_vector(7 downto 0);
    begin
      s_buf <= din8;
      dout(7 downto 0) <= s_buf;
    end;
    when 1 =>
      signal s_buf : bit_vector(15 downto 0);
    begin
      s_buf <= din16;
      dout(15 downto 0) <= s_buf;
    end;
    when others =>
      dout <= (others => '0');
  end generate gen_wide;
end architecture bh;
