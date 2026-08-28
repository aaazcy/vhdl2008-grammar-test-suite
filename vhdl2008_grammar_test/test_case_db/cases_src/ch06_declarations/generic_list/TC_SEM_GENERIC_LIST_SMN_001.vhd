-- =============================================================
-- Case ID: TC_SEM_GENERIC_LIST_SMN_001
-- Related Rule ID: SEM_GENERIC_LIST_SMN_001
-- Rule Type: Semantic (Negative)
-- BNF Production: GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Test Focus: Semantic error — duplicate generic names in the generic list.
--   The generic_interface_list contains two declarations with the same
--   identifier WIDTH. VHDL requires each generic name to be unique within
--   the generic clause. This is a semantic error (duplicate declaration),
--   not a syntax error.
-- Case Type: Negative (Semantic)
-- Expected Result: Triggers semantic error (duplicate generic identifier)
-- Dependencies: None
-- =============================================================

-- ERROR: WIDTH declared twice in the same generic list. VHDL does not
-- permit duplicate identifiers within the same declarative region.
entity data_path is
  generic (
    WIDTH : integer := 8;
    WIDTH : integer := 16
  );
  port (
    din  : in  bit_vector(WIDTH-1 downto 0);
    dout : out bit_vector(WIDTH-1 downto 0)
  );
end entity data_path;

architecture rtl of data_path is
begin
  dout <= din;
end architecture rtl;
