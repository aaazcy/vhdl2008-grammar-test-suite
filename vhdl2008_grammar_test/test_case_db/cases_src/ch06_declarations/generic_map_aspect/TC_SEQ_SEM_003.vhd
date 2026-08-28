-- =============================================================
-- Case ID: TC_SEQ_SEM_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_IFACE_005
-- Standard Reference: Chapter 6.5.7.1
-- Rule Summary: Generic map association element must reference a valid generic
-- Test Focus: Positive: WIDTH => 8 in the generic map references a legal generic name declared in the component, and the generic map correctly maps all formal generics at component instantiation - verifying an association_element of generic_map_aspect referencing a declared generic is legal
-- Case Type: Positive
-- Error Category: interface_violation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Positive: Correct generic map association
entity seq_sem_001_comp is
  generic (WIDTH : integer := 8);
  port (d : in bit_vector(WIDTH-1 downto 0); q : out bit_vector(WIDTH-1 downto 0));
end entity seq_sem_001_comp;

architecture behav of seq_sem_001_comp is
begin
  q <= d;
end architecture behav;

entity seq_sem_001_top is
end entity seq_sem_001_top;

architecture behav of seq_sem_001_top is
  component seq_sem_001_comp is
    generic (WIDTH : integer := 8);
    port (d : in bit_vector(WIDTH-1 downto 0); q : out bit_vector(WIDTH-1 downto 0));
  end component seq_sem_001_comp;
  signal d_sig, q_sig : bit_vector(7 downto 0);
begin
  u_inst : seq_sem_001_comp
    generic map (WIDTH => 8)
    port map (d => d_sig, q => q_sig);
end architecture behav;
