-- =============================================================
-- Case ID: TC_SEM_ENT_003_SEM_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_003
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: generic names within the same entity must be unique — generics with different names can coexist
-- Case Type: Positive
-- Error Category: declaration_elaboration_error
-- Test Focus: Positive example: entity has 3 generics(G_DATA_W, G_ADDR_W, G_DEBUG), each with a different name, types covering integer/boolean/time, verifying compilation passes when all generic names are unique
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_gen_ok is
  generic(
    G_DATA_W : integer := 16;
    G_ADDR_W : integer := 8;
    G_DEBUG  : boolean := false
  );
  port(
    addr : in  integer range 0 to 2**G_ADDR_W-1;
    data : out bit_vector(G_DATA_W-1 downto 0)
  );
end entity ent_gen_ok;
architecture bh of ent_gen_ok is
  signal s_data : bit_vector(G_DATA_W-1 downto 0) := (others => '0');
begin
  s_data <= (others => '1') when G_DEBUG else (others => '0');
  data <= s_data;
end architecture bh;
