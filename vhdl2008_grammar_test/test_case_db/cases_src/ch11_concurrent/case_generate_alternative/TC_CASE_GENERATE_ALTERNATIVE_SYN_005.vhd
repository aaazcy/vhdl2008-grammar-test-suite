-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_GENERATE_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: case_generate_alternative ::= when [ alternative_label : ] choices => generate_statement_body
-- Case Type: Positive
-- Test Focus: generate_statement_body contains block_declarative_part + concurrent statements — the body of each when branch declares local signals and includes multiple concurrent statements, verifying that an alternative body may contain a complete block structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cgen_alt_body_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity cgen_alt_body_ent;
architecture bh of cgen_alt_body_ent is
  constant op : integer := 1;
begin
  gen_op : case op generate
    when 0 =>
      dout <= din;
    when 1 =>
      signal s_pipe : bit_vector(7 downto 0);
    begin
      proc_reg : process(clk) is
      begin
        if clk'event and clk = '1' then
          s_pipe <= din;
          dout   <= s_pipe;
        end if;
      end process proc_reg;
    end;
    when others =>
      dout <= not din;
  end generate gen_op;
end architecture bh;
