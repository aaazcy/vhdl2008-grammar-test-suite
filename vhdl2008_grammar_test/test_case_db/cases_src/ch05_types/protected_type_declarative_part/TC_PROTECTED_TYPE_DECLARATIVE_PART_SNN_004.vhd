-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: ERROR — type_declaration inside the declarative
--   part. Type declarations are not in the valid set of
--   declarative items for the type declaration side.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_decl_dp_snn_type_decl is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_snn_type_decl;

architecture rtl of pt_decl_dp_snn_type_decl is
  type t_pt is protected
    type t_err is range 0 to 3;                -- ERROR: type decl not in { declarative_item }
    procedure set(x : integer);
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(1); val <= 1;
    end if;
  end process;
end architecture rtl;
