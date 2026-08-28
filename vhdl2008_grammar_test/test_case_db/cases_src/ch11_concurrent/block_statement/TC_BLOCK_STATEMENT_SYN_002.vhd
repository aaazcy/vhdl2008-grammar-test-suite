-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block with "is" + declarative_part(signal declaration) + single concurrent assignment using that signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_sig_ent is
  port(clk : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity blk_sig_ent;
architecture rtl of blk_sig_ent is
begin
  blk_reg : block is
    signal s_reg : bit_vector(7 downto 0) := (others => '0');
  begin
    process(clk)
    begin
      if clk'event and clk = '1' then
        s_reg <= din;
      end if;
    end process;
    dout <= s_reg;
  end block blk_reg;
end architecture rtl;
