-- =============================================================
-- Case ID: TC_SEQ_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_IFACE_005
-- Standard Reference: Chapter 6.5.7.1
-- Rule Summary: Generic map association element must reference a valid generic
-- Test Focus: Negative: WIDHT => 8 in the generic map references a generic name that does not exist in the component declaration (WIDHT != WIDTH), triggering interface_violation - verifying the formal_designator of an association_element in generic_map_aspect must reference a generic declared by the component
-- Case Type: Negative
-- Error Category: interface_violation
-- Expected Result: Triggers semantic error: invalid generic name in generic map
-- Dependencies: None
-- =============================================================

-- NEGATIVE: Generic map references non-existent generic "WIDHT" (typo)
entity seq_smn_001_comp is
  generic (WIDTH : integer := 8);
  port (d : in bit_vector(7 downto 0); q : out bit_vector(7 downto 0));
end entity seq_smn_001_comp;

architecture behav of seq_smn_001_comp is
begin
  q <= d;
end architecture behav;

entity seq_smn_001_top is
end entity seq_smn_001_top;

architecture behav of seq_smn_001_top is
  component seq_smn_001_comp is
    generic (WIDTH : integer := 8);
    port (d : in bit_vector(7 downto 0); q : out bit_vector(7 downto 0));
  end component seq_smn_001_comp;
  signal d_sig, q_sig : bit_vector(7 downto 0);
begin
  u_inst : seq_smn_001_comp
    generic map (WIDHT => 8)  -- Error: WIDHT is not a generic of this component
    port map (d => d_sig, q => q_sig);
end architecture behav;
