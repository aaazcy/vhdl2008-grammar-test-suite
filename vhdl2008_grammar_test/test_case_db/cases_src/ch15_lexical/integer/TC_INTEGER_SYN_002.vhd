-- =============================================================
-- Case ID: TC_INTEGER_SYN_002
-- Rule Type: Syntax
-- BNF Production: INTEGER
-- IEEE Section: 15.5.3
-- BNF Text: integer ::= digit { [ underline ] digit }
-- Test Focus: Integer literals with underscore separators for large number readability
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity integer_syn_002 is
  port (
    addr_out : out integer range 0 to 1048575
  );
end entity integer_syn_002;

architecture bh of integer_syn_002 is
  -- Large integers with underscore grouping (thousands separators)
  constant C_MEM_SIZE  : integer := 1_048_576;
  constant C_CACHE_LINE : integer := 64;
  constant C_NUM_LINES  : integer := C_MEM_SIZE / C_CACHE_LINE;
  signal s_addr         : integer range 0 to 1048575 := 1_000_000;
begin
  s_addr <= 1_000_000;
  addr_out <= s_addr;
end architecture bh;
