-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_013
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: complex block combining all features: generic+port header, rich declarative part with signal+constant+subtype, guarded signal assignment, multiple concurrent statements, matching end label
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity blk_full_ent is
  port(clk, en : in std_logic; din : in std_logic_vector(7 downto 0); dout : out std_logic_vector(7 downto 0));
end entity blk_full_ent;
architecture rtl of blk_full_ent is
  signal s_in  : std_logic_vector(7 downto 0);
  signal s_out : std_logic_vector(7 downto 0);
begin
  s_in <= din;
  blk_pipe : block(en = '1') is
    generic(g_w : positive := 8);
    generic map(g_w => 8);
    port(p_in : in std_logic_vector(g_w - 1 downto 0); p_out : out std_logic_vector(g_w - 1 downto 0));
    port map(p_in => s_in, p_out => s_out);
    subtype t_byte is std_logic_vector(7 downto 0);
    constant C_RST : t_byte := (others => '0');
    signal s_reg   : t_byte register := C_RST;
  begin
    process(clk)
    begin
      if clk'event and clk = '1' then
        s_reg <= p_in;
      end if;
    end process;
    s_reg <= guarded s_reg;
    p_out <= s_reg;
  end block blk_pipe;
  dout <= s_out;
end architecture rtl;
