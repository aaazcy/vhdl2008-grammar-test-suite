-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: a block contains multiple kinds of concurrent statements: concurrent signal assignment + concurrent assertion + process — verifying that block_statement_part can mix several concurrent statement kinds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity blk_part_mixed_ent is
  port(clk, rst_n : in std_logic; d : in std_logic; q : out std_logic);
end entity blk_part_mixed_ent;
architecture bh of blk_part_mixed_ent is
  signal s_reg : std_logic := '0';
begin
  blk_mix : block is
    signal s_local : std_logic;
  begin
    -- concurrent signal assignment
    s_local <= d when rst_n = '1' else '0';
    -- concurrent assertion
    assert not (clk'event and clk = '1' and s_local = 'X')
      report "data X on clock edge" severity warning;
    -- process as concurrent statement
    proc_reg : process(clk) is
    begin
      if clk'event and clk = '1' then
        if rst_n = '1' then
          s_reg <= s_local;
        else
          s_reg <= '0';
        end if;
      end if;
    end process proc_reg;
    q <= s_reg;
  end block blk_mix;
end architecture bh;
