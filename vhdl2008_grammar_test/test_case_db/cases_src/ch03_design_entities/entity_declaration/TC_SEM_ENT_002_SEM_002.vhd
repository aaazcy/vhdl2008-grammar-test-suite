-- =============================================================
-- Case ID: TC_SEM_ENT_002_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_002
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: port names within the same entity must be unique — ports with different names can coexist
-- Case Type: Positive
-- Error Category: declaration_elaboration_error
-- Test Focus: Positive example: entity has 4 ports(clk, rst_n, din, dout), each with a different name, using various types(bit, bit_vector, integer range), verifying compilation passes when all port names are unique in the entity declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_ports_ok is
  port(
    clk   : in  bit;
    rst_n : in  bit;
    din   : in  bit_vector(7 downto 0);
    dout  : out bit_vector(7 downto 0)
  );
end entity ent_ports_ok;
architecture bh of ent_ports_ok is
  signal s_reg : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then s_reg <= (others => '0');
    elsif clk'event and clk = '1' then s_reg <= din; end if;
  end process;
  dout <= s_reg;
end architecture bh;
