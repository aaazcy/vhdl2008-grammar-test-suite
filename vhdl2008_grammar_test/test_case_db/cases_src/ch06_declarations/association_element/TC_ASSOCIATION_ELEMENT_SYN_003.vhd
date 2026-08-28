-- =============================================================
-- Case ID: TC_ASSOCIATION_ELEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Positive (Production-Specific)
-- Test Focus: association_element — exercises the positional association
--             form (without formal_part =>) in both port map and generic
--             map contexts. Each element is a bare actual_part.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity association_element_syn3 is
  port (
    clk      : in  bit;
    toggle   : in  bit;
    q_out    : out bit_vector(3 downto 0)
  );
end entity association_element_syn3;

architecture arch of association_element_syn3 is

  component sync_counter is
    generic (
      WIDTH : integer := 4
    );
    port (
      clock   : in  bit;
      enable  : in  bit;
      count   : out bit_vector(3 downto 0)
    );
  end component;

  signal s_count : bit_vector(3 downto 0);

begin

  -- association_element without formal_part => (positional association)
  -- Elements are listed in port declaration order:
  --   clock, enable, count
  -- No formal_part names used — pure positional mapping.
  u_counter : component sync_counter
    generic map (4)
    port map (clk, toggle, s_count);

  q_out <= s_count;

end architecture arch;
