-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific index_subtype_definition using
--            multiple type_marks: integer, natural, and enumeration.
--            A generic sorting network with unconstrained input
--            width.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sorting_network is
  port (
    a     : in  integer range 0 to 255;
    b     : in  integer range 0 to 255;
    c     : in  integer range 0 to 255;
    min_v : out integer range 0 to 255;
    med_v : out integer range 0 to 255;
    max_v : out integer range 0 to 255
  );
end entity sorting_network;

architecture rtl of sorting_network is
  -- index_subtype_definition: integer range <>
  type sort_vec is array (integer range <>) of integer range 0 to 255;
  subtype triple is sort_vec(0 to 2);
  signal vals : triple;
  procedure sort3 (signal v : inout triple) is
    variable tmp : integer range 0 to 255;
  begin
    if v(0) > v(1) then tmp := v(0); v(0) <= v(1); v(1) <= tmp; end if;
    if v(1) > v(2) then tmp := v(1); v(1) <= v(2); v(2) <= tmp; end if;
    if v(0) > v(1) then tmp := v(0); v(0) <= v(1); v(1) <= tmp; end if;
  end procedure;
begin
  vals <= (a, b, c);
  process(vals)
    variable sorted : triple;
  begin
    sorted := vals;
    if sorted(0) > sorted(1) then
      sorted(0) := vals(1); sorted(1) := vals(0);
    end if;
    if sorted(1) > sorted(2) then
      sorted(1) := vals(2); sorted(2) := vals(1);
    end if;
    if sorted(0) > sorted(1) then
      sorted(0) := sorted(1); sorted(1) := vals(0);
    end if;
    min_v <= sorted(0);
    med_v <= sorted(1);
    max_v <= sorted(2);
  end process;
end architecture rtl;
