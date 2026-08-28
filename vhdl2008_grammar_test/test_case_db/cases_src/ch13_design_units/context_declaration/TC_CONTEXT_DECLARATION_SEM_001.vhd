-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONTEXT_NAME_UNIQUE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive (semantic verification)
-- Rule Description: the identifier of a context_declaration is unique within the same scope and can be referenced by later design units through context_reference
-- Test Focus: cross-design-unit context reference: declare context_declaration first, then reference it with context work.ctx_name in another entity's context_clause — verifying the context declaration name can be referenced by later design units and takes effect
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_reusable is
  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
end context ctx_reusable;

context work.ctx_reusable;

entity cd_reuse_ent is
  port(
    clk : in  std_ulogic;
    rst : in  std_ulogic;
    cnt : out std_logic_vector(7 downto 0)
  );
end entity cd_reuse_ent;

architecture rtl of cd_reuse_ent is
  signal s_cnt : unsigned(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        s_cnt <= (others => '0');
      else
        s_cnt <= s_cnt + 1;
      end if;
    end if;
  end process;
  cnt <= std_logic_vector(s_cnt);
end architecture rtl;
