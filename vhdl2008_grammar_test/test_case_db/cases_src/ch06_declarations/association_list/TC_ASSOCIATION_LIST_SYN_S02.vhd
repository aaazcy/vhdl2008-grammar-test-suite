-- =============================================================
-- Case ID: TC_ASSOCIATION_LIST_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element { , association_element }
-- Case Type: Positive
-- Test Focus: Production-specific: exercises association_list with a long comma-separated list of port associations.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assoc_list_syn_s2 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(7 downto 0);
    q_out : out bit_vector(7 downto 0)
  );
end entity assoc_list_syn_s2;

architecture rtl of assoc_list_syn_s2 is
  component dff_8bit is
    port (
      clock  : in  bit;
      d      : in  bit_vector(7 downto 0);
      q      : out bit_vector(7 downto 0);
      q_n    : out bit_vector(7 downto 0)
    );
  end component;
  signal s_q_n : bit_vector(7 downto 0);
begin
  u_dff : dff_8bit
    port map (
      clock => clk,
      d     => d_in,
      q     => q_out,
      q_n   => s_q_n
    );
end architecture rtl;
