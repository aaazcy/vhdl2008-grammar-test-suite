-- =============================================================
-- Case ID: TC_SEM_ARCH_002_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_002
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: The entity_name of architecture_body must reference an entity already declared in the same design library - a correct reference is legal
-- Case Type: Positive
-- Error Category: scope_visibility_error
-- Test Focus: Positive case: first declare entity sem_arch_002_ent (with 3 generics and 4 ports, using integer range subtype and bit_vector), then 2 architectures (structural and behavioral) both correctly reference that entity name, verifying compilation passes when entity_name is correctly referenced
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sem_arch_002_ent is
  generic(ADDR_W:integer:=8; DATA_W:integer:=16; ENABLE:boolean:=true);
  port(clk:in bit; addr:in integer range 0 to 255; din:in bit_vector(DATA_W-1 downto 0); dout:out bit_vector(DATA_W-1 downto 0));
end entity;
architecture structural of sem_arch_002_ent is
  component mem is
    generic(AW:integer; DW:integer);
    port(clk:in bit; addr:in integer range 0 to 255; din:in bit_vector(DW-1 downto 0); dout:out bit_vector(DW-1 downto 0));
  end component;
  signal s_dout:bit_vector(DATA_W-1 downto 0);
begin
  u_mem:mem generic map(AW=>ADDR_W, DW=>DATA_W)
    port map(clk=>clk, addr=>addr, din=>din, dout=>s_dout);
  dout<=s_dout;
end architecture structural;
