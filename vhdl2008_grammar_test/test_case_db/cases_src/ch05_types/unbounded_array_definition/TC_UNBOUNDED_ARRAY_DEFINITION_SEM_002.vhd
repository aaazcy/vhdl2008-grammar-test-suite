-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Semantic: unbounded array used for a parameterizable
--            content-addressable memory (CAM). The CAM depth is
--            defined by the unbounded array constrained at
--            instantiation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cam_search is
  port (
    clk     : in  bit;
    search  : in  bit_vector(7 downto 0);
    entry   : in  integer range 0 to 7;
    match   : out bit;
    hit_idx : out integer range 0 to 7
  );
end entity cam_search;

architecture rtl of cam_search is
  -- unbounded_array_definition for CAM entries
  type cam_mem is array (integer range <>) of bit_vector(7 downto 0);
  subtype cam_8 is cam_mem(0 to 7);
  signal cam : cam_8 := (others => X"00");
  signal write_en : bit := '0';
  signal match_vec : bit_vector(0 to 7) := (others => '0');
begin
  process(clk)
    variable hit_found : bit := '0';
    variable hit_pos   : integer range 0 to 7 := 0;
  begin
    if clk'event and clk = '1' then
      if write_en = '1' then
        cam(entry) <= search;
      end if;
      hit_found := '0';
      hit_pos   := 0;
      for i in 0 to 7 loop
        if cam(i) = search and hit_found = '0' then
          hit_found := '1';
          hit_pos   := i;
        end if;
      end loop;
      match   <= hit_found;
      hit_idx <= hit_pos;
    end if;
  end process;
end architecture rtl;
