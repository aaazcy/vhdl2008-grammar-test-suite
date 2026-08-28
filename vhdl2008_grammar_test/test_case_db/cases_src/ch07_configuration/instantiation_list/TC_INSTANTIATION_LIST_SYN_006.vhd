-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: instantiation_list "all" with "use open" binding -- exercises the "for all : comp use open" form where the instantiation_list "all" specifies that every instance of the component type remains unbound; tests that "all" works correctly with the open binding indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity il_all_open is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture structural of il_all_open is
  component invert is
    port(a : in bit; y : out bit);
  end component;

  -- instantiation_list "all" with open binding (no entity binding)
  for all : invert use open;

  signal mid : bit := '0';
begin
  u_inv : invert
    port map(a => din, y => mid);
  dout <= mid;
end architecture structural;
