-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Two-dimensional constrained array for a 64-byte
--            cache with 4 lines of 16 bytes each. Both dimensions
--            use explicit index_constraints.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cache_memory_4x16 is
  port (
    clk    : in  bit;
    we     : in  bit;
    line   : in  integer range 0 to 3;
    offset : in  integer range 0 to 15;
    wdata  : in  bit_vector(7 downto 0);
    rdata  : out bit_vector(7 downto 0)
  );
end entity cache_memory_4x16;

architecture rtl of cache_memory_4x16 is
  -- constrained_array_definition: 2D array with two index_constraints
  type cache_line is array (0 to 15) of bit_vector(7 downto 0);
  type cache_mem is array (0 to 3) of cache_line;
  signal cache : cache_mem := (others => (others => X"00"));
  signal tag_valid : bit_vector(0 to 3) := "0000";
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if we = '1' then
        cache(line)(offset) <= wdata;
        tag_valid(line) <= '1';
      end if;
      rdata <= cache(line)(offset);
    end if;
  end process;
end architecture rtl;
