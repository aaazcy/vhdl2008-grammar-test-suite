-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: Semantic: element_subtype_definition in a memory
--            protection unit (MPU) region descriptor table.
--            Each region has a constrained base address, size,
--            and access permissions.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mpu_region_table is
  port (
    clk       : in  bit;
    region    : in  integer range 0 to 7;
    base_addr : in  integer range 0 to 1048575;
    size_kb   : in  integer range 4 to 1024;
    rwx       : in  bit_vector(2 downto 0);
    hit       : out bit
  );
end entity mpu_region_table;

architecture rtl of mpu_region_table is
  -- element_subtype_definitions
  subtype addr_t is integer range 0 to 1048575;
  subtype size_t is integer range 4 to 1024;
  subtype perm_t is bit_vector(2 downto 0);
  type mpu_entry is record
    base   : addr_t;
    region_size : size_t;
    acc : perm_t;
    enable : bit;
  end record;
  type mpu_table is array (0 to 7) of mpu_entry;
  signal mpu : mpu_table := (others =>
    (base => 0, region_size => 4, acc => "000", enable => '0'));
  signal addr_check : integer range 0 to 1048575;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      mpu(region).base        <= base_addr;
      mpu(region).region_size <= size_kb;
      mpu(region).acc         <= rwx;
      mpu(region).enable      <= '1';
      if addr_check >= mpu(region).base and
         addr_check < mpu(region).base + mpu(region).region_size * 1024 then
        hit <= mpu(region).enable;
      else
        hit <= '0';
      end if;
    end if;
  end process;
  addr_check <= base_addr;
end architecture rtl;
